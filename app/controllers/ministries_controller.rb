class MinistriesController < ApplicationController

	before_action :set_ministry, only: [:show]

	def new
		@ministry = Ministry.new
		1.times {@ministry.departments.build}
	end

	def show
		@departments = Department.where(ministry: @ministry)
	end

	def create
		@ministry = Ministry.new(ministry_params)
		if @ministry.save
			@ministry.departments.each do |d|
				d.officer = User.with_email(d.officer.email)
				d.officer.role = User.roles["officer"]
				d.officer.send_reset_password_instructions
			end
			return redirect_to admin_dashboard_path, notice: "Successfully created Ministry!"
		else
			return redirect_to new_department_path, notice: "Error Occurred while saving!"
		end	
	end

	private

	def set_ministry
		@ministry = Ministry.find_by_id(params[:id])
	end

	def ministry_params
		params.require(:ministry).permit(:name,:description, departments_attributes: [:name, officer_attributes: [:email]])	
	end

end
