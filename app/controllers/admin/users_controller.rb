class Admin::UsersController < Admin::AdministratorController
  
	def index
    @users = User.where(:role => 2)
    # @search = User.search(params[:q])
    # @users = @search.result.where(:role => 2)
  end

  def show
    @user = User.find(params[:id])
    @coach = Coach.all
    @staff = Staff.all
    @player = Player.all
  end

  def edit
    @user = User.find(params[:id])
    if request.xhr?
      render :text =>  @user.to_json
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      if request.xhr?
        render :text => {succsess:true}.to_json
      else
        flash[:notice] = "Successfully updated"
        redirect_to :action => "index"
      end
    else
      render :action => "new"
    end
  end

  def destroy
    if User.find(params[:id]).destroy
      flash[:notice] = "Successfully deleted"
      redirect_to :action => "index"
    end
  end

end
