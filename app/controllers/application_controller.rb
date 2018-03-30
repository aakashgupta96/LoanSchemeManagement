class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize
  
  delegate :allow?, to: :current_permission
  helper_method :allow?

  delegate :allow_param?, to: :current_permission
  helper_method :allow_param?

  def after_sign_in_path_for(resource)
  	if resource.applicant?
  		"/users/dashboard"
  	elsif resource.officer?
  		"/officers/dashboard"
    elsif resource.nodal_employee?
      "/nodal_employees/dashboard"
  	else
  		"/admins/dashboard"
  	end
  end

  def current_user
  	@user = User.find_by_id(session["user_id"])
  end

  private

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorize
    if !current_permission.allow?(params[:controller], params[:action])
      redirect_to root_url, alert: "Not authorized."
    end
  end

end
