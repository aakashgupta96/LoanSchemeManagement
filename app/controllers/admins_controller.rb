class AdminsController < ApplicationController
	
	def dashboard
		@ministries = Ministry.all
	end

	def authorization_requests
		@users = User.scheme_provider.where(disabled: true)
	end

	def authorize_scheme_provider
		@employee = User.find_by_id(params[:user_id])
		byebug
		@employee.update(disabled: false)
		return redirect_to authorization_requests_path, notice: "Succesfully Granted Permission"
	end


end