class UsersController < ApplicationController

  load_and_authorize_resource

  def show
    @user = User.find(params[:id])
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
        redirect_to :action => root_url
      end
    else
      render :action => "new"
    end
  end

  def destroy
    if User.find(params[:id]).destroy
      flash[:notice] = "Successfully deleted"
      redirect_to root_url
    end
  end

end
