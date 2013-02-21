class Admin::AdministratorController < ApplicationController

	load_and_authorize_resource

	layout "admin"

	before_filter :is_admin?

  def is_admin?
    if !current_user || (current_user && !current_user.is_admin?)
    	redirect_to admin_users_path
    end
  end

end
