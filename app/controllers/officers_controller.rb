class OfficersController < ApplicationController

	before_action :authenticate_officer

	def authenticate_officer  
		@user = current_user
		if @user
			if @user.officer?
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

	def add_scheme 
		department = Department.find_by_user_id(current_user.id)
		@scheme = department.schemes.create(name: params[:name], guidelines: params[:guidelines], collateral: params[:collateral], ticket_size: params[:ticket_size], interest_rate: params[:interest_rate])
		if @scheme.save
			return redirect_to officer_dashboard_path, notice: "Successfully created scheme!"
		else
			return redirect_to officer_add_scheme_path, notice: "Unable to create scheme"
		end
	end

end