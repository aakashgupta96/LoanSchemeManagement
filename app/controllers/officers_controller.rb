class OfficersController < ApplicationController

	def dashboard
		
	end

	def new_employee
		
	end

	def create_employee
		@user = User.with_email(params[:user][:email])
		@user.nodal_employee!
		@department = current_user.department
		@department.employees << @user
		@user.send_reset_password_instructions
		return redirect_to officer_dashboard_path, notice: "Employee Successfully Added"
	end

end