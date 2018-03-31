class OfficersController < ApplicationController

	def dashboard
		
	end

	def new_employee
		
	end

	def create_employee
		@employee = User.with_email(params[:user][:email])
		@employee.nodal_employee!
		@department = current_user.department
		@department.employees << @employee
		@employee.send_reset_password_instructions
		return redirect_to officer_dashboard_path, notice: "Employee Successfully Added"
	end

end