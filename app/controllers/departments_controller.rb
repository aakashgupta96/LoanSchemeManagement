class DepartmentsController < ApplicationController

	def new
		@department = Department.new
		@department.build_officer
	end

	def create
		@department = Department.new(department_params)
		@department.officer = User.with_email(@department.officer.email)
		@department.officer.role = User.roles["officer"]
		if @department.save
			@department.officer.send_reset_password_instructions
			return redirect_to admin_dashboard_path, notice: "Successfully created department!"
		else
			return redirect_to new_department_path, notice: "Error Occurred while saving!"
		end	
	end

	private

	def department_params
		params.require(:department).permit(:name,officer_attributes: [:email])	
	end

end
