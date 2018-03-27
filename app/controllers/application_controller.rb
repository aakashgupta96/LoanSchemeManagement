class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :user_signed_in?

  def user_signed_in?
    !session[:user_id].nil?
  end

  def after_sign_in_path_for(resource)
  	if resource.applicant?
  		"/users/dashboard"
  	elsif resource.officer?
  		"/officers/dashboard"
  	else
  		"/admins/dashboard"
  	end
  end

  # def current_user
  # 	@user = User.find_by_id(session["user_id"])
  # end

  def current_user
    if user_signed_in?
      User.find(session[:user_id])
    end
  end

  # def user_officer?
  #   current_user.officer?
  # end

end
