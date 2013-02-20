class Admin::TournamentsController < Admin::AdministratorController

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(params[:tournament])
    if @tournament.save
      flash[:notice] = "Successfully created"
      redirect_to admin_tournaments_path
    else
      render :action => 'new'
    end
  end

  def edit
    @tournament = Tournament.find(params[:id])
    if request.xhr?
      render :text =>  @tournament.to_json
    end
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update_attributes(params[:tournament])
      if request.xhr?
        render :text => {succsess:true}.to_json
      else
        flash[:notice] = "Successfully updated"
        redirect_to admin_tournaments_path
      end
    else
      render :action => "new"
    end
  end

  def destroy
    if Tournament.find(params[:id]).destroy
      flash[:notice] = "Successfully deleted"
      redirect_to admin_tournaments_path
    end
  end

end
