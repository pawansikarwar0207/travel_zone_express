class ApplicationController < ActionController::Base
  before_action :authenticate_user!
	def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  def authenticate_admin!
    redirect_to root_path, alert: "You are not authorized!" unless current_user&.admin?
  end
end
