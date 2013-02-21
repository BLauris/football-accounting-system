class StaffsController < ApplicationController

  load_and_authorize_resource

  after_filter :save_assets, :only => [:create]

	def index
    @search = Staff.search(params[:q])
    @staffs = @search.result.where(:user_id => current_user.id)
  end

  def show
    @staff = Staff.find(params[:id])
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(params[:staff])
    @staff.user_id = current_user.id
    if @staff.save
      flash[:notice] = "Successfully created"
      redirect_to :action => "index"
    else
      render :action => "new"
    end
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
        redirect_to :action => "index"
      end
    else
      render :action => "new"
    end
  end

  def destroy
    if Staff.find(params[:id]).destroy
      flash[:notice] = "Successfully Deleted"
      redirect_to :action => "index"
    end
  end

  private

  def save_assets
    if @staff.id
      Asset.save_assets_for("Staff", @staff.id, params[:asset_ids]) 
    end
  end

end
