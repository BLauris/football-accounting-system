class Admin::UsersController < Admin::AdministratorController
  
	def index
    @users = User.where(:role => 2)
    # @search = User.search(params[:q])
    # @users = @search.result.where(:role => 2)
  end

  def show
    @user = User.find(params[:id])
  end

end
