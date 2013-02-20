class Admin::PlayersController < Admin::AdministratorController

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
        flash[:notice] = "Updated"
        redirect_to admin_players_path
      end
    else
      render :action => "new"
    end
  end

  def destroy
    if Player.find(params[:id]).destroy
      flash[:notice] = "Deleted"
      redirect_to admin_players_path
    end
  end

end
