class Admin::PlayersController < Admin::AdministratorController

  after_filter :save_assets, :only => [:create]

	def show
		@player = Player.find(params[:id])
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
        redirect_to admin_tournaments_path
      end
    else
      render :action => "new"
    end
  end

  def destroy
    if Player.find(params[:id]).destroy
      flash[:notice] = "Successfully deleted"
      redirect_to admin_tournaments_path
    end
  end

  private

  def save_assets
    if @staff.id
      Asset.save_assets_for("Player", @player.id, params[:asset_ids]) 
    end
  end

end
