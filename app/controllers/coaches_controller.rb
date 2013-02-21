class CoachesController < ApplicationController

  load_and_authorize_resource

  after_filter :save_assets, :only => [:create]

	def index
    @search = Coach.search(params[:q])
    @coaches = @search.result.where(:user_id => current_user.id)
  end

  def show
    @coach = Coach.find(params[:id])
  end

  def new
    @coach = Coach.new
  end

  def create
    @coach = Coach.new(params[:coach])
    @coach.user_id = current_user.id
    if @coach.save
      flash[:notice] = "Successfully created"
      redirect_to :action => "index"
    else
      render :action => "new"
    end
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
        redirect_to :action => "index"
      end
    else
      render :action => "new"
    end
  end

  def destroy
    if Coach.find(params[:id]).destroy
      flash[:notice] = "Successfully deleted"
      redirect_to :action => "index"
    end
  end

  private

  def save_assets
    if @coach.id
      Asset.save_assets_for("Coach", @coach.id, params[:asset_ids]) 
    end
  end

end
