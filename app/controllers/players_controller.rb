class PlayersController < ApplicationController

  load_and_authorize_resource

  after_filter :save_assets, :only => [:create]

	def index
    @search = Player.search(params[:q])
    @players = @search.result.where(:user_id => current_user.id)
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(params[:player])
    @player.user_id = current_user.id
    if @player.save
      flash[:notice] = "Successfully created"
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def edit
    @player = Player.find(params[:id])
    if request.xhr?
      render :text =>  @player.to_json
    end
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(params[:player])
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
    if Player.find(params[:id]).destroy
      flash[:notice] = "Successfully deleted"
      redirect_to :action => "index"
    end
  end

  private

  def save_assets
    if @player.id
      Asset.save_assets_for("Player", @player.id, params[:asset_ids]) 
    end
  end

end
