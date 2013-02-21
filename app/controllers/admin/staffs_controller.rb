class Admin::StaffsController < Admin::AdministratorController

  after_filter :save_assets, :only => [:create]

	def show
		@staff = Staff.find(params[:id])
	end

	def edit
    @staff = Staff.find(params[:id])
    if request.xhr?
      render :text =>  @staff.to_json
    end
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.update_attributes(params[:staff])
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
    if Staff.find(params[:id]).destroy
      flash[:notice] = "Successfully deleted"
      redirect_to admin_tournaments_path
    end
  end

  private

  def save_assets
    if @staff.id
      Asset.save_assets_for("Staff", @staff.id, params[:asset_ids]) 
    end
  end

end
