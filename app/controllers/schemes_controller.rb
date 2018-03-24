class SchemesController < OfficersController

	#before_action :authenticate_officer only: :create , :viewAll , :view

	def new
		@scheme= Scheme.new
	end

	def create
		@scheme=Scheme.new(scheme_params)
		@user=current_user
		dept=Department.find_by_user_id(@user.id)
		@scheme.department_id = dept.id
		if @scheme.save
			return redirect_to officer_dashboard_path, notice: "Successfully added scheme!"
		else
			return redirect_to new_scheme_path, notice: "Error Occurred while saving!"
		end	
	end


	def apply
	end

	def viewAll 
		@applications = LoanApplication.all
	end

	def view
		appName = params[:val]
		@app = LoanApplication.find_by_name(appName)

	end

	def scheme_params
		params.require(:scheme).permit(:name, :collateral)	
	end
	
end
