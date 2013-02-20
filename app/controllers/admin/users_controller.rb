class Admin::UsersController < Admin::AdministratorController
  
	def index
    @users = User.where(:role => 2)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Created"
      redirect_to :action => "index"
    else
      render :action => "new"
    end
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
        flash[:notice] = "Updated"
        redirect_to :action => "index"
      end
    else
      render :action => "new"
    end
  end

  def destroy
    if User.find(params[:id]).destroy
      flash[:notice] = "Deleted"
      redirect_to :action => "index"
    end
  end

end
