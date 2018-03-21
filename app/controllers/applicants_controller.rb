class ApplicantsController < ApplicationController
	
	before_action :authenticate_applicant

	def authenticate_applicant
		@user = current_user
		if @user
			if @user.applicant?
				return true
			else
				return redirect_to after_sign_in_path_for(@user), notice: "Unauthorized!"
			end
		else
			return redirect_to sign_in_user_path, notice: "Please sign in to continue!"
		end
	end

	def dashboard
		
	end

end
