class Admin::AdministratorController < ApplicationController

	layout "admin"

	before_filter :is_admin?

  def is_admin?
    if !current_user || (current_user && !current_user.is_admin?)
    	redirect_to root_path
    end
  end

end
