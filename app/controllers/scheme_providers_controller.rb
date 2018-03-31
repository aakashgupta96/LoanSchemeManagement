class SchemeProvidersController < ApplicationController

	before_action :check_status

	def dashboard
		@ministries = Ministry.all
	end

	private

	def check_status
		(return redirect_to root_path, notice: "Account Is Not Activated yet.") if current_user.disabled
	end

end