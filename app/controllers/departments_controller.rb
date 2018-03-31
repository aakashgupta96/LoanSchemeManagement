class DepartmentsController < ApplicationController
	
	before_action :set_ministry
	before_action :set_department, only: [:show, :edit, :update, :destroy]

	def new
		@department = Department.new
		@department.build_officer
	end

	def show
		@user = current_user
	end

	def edit
		
	end

	def update
	
	end

	def create
		@department = Department.new(department_params)
		@department.officer = User.with_email(@department.officer.email)
		@department.ministry = @ministry
		@department.officer.role = User.roles["officer"]
		if @department.save
			@department.officer.send_reset_password_instructions
			return redirect_to ministry_path(@ministry), notice: "Successfully created department!"
		else
			return redirect_to new_department_path, notice: "Error Occurred while saving!"
		end	
	end

	private

	def set_ministry
		@ministry = Ministry.find_by_id(params[:ministry_id])
		(return redirect_to after_sign_in_path_for(current_user), notice: "Invalid Details") if @ministry.nil?
	end

	def set_department
		@department = Department.find_by_id(params[:department_id])
		(return redirect_to after_sign_in_path_for(current_user), notice: "Invalid Details") if @department.nil?
	end


	def department_params
		params.require(:department).permit(:name,officer_attributes: [:email])	
	end

end
