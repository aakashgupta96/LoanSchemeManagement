class SchemeProvidersController < ApplicationController

	before_action :check_status

	def dashboard

	end

	private

	def check_status
		session["user_id"] = nil
		#byebug
		#(return redirect_to root_path, notice: "Account Is Not Activated yet.") if current_user.disabled
	end

end