class Admin::CoachesController < Admin::AdministratorController

  after_filter :save_assets, :only => [:create]

	def show
		@coach = Coach.find(params[:id])
	end

	def edit
    @coach = Coach.find(params[:id])
    if request.xhr?
      render :text =>  @coach.to_json
    end
  end

  def update
    @coach = Coach.find(params[:id])
    if @coach.update_attributes(params[:coach])
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
    if Coach.find(params[:id]).destroy
      flash[:notice] = "Successfully deleted"
      redirect_to admin_tournaments_path
    end
  end

  private

  def save_assets
    if @staff.id
      Asset.save_assets_for("Coach", @coach.id, params[:asset_ids]) 
    end
  end

end
