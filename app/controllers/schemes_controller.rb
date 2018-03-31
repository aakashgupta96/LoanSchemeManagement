class SchemesController < ApplicationController

  before_action :set_department
  before_action :set_scheme, only: [:show, :edit, :update, :destroy]

  def create
    @scheme = Scheme.new(scheme_params)
    @scheme.officer = User.with_email(@department.officer.email)
    @scheme.department = @department
    @scheme.officer.role = User.roles["officer"]
    if @scheme.save
      return redirect_to department_path(@department.ministry,@department), notice: "Successfully created scheme"
    else
      return redirect_to new_department_path, notice: "Error Occurred while saving!"
    end
  end

  def update

  end

  def new
    @scheme = Scheme.new
    3.times {@scheme.eligibilities.build}
  end

  private
  def scheme_params
    params.require(:scheme).permit(:name, :guidelines, :ticket_size, :department_id, :interest_rate, :ticket_size, eligibilities_attributes: [:details, :bucket, :value])
  end

  def set_department
    @department = Department.find_by_id(params[:department_id])
    (return redirect_to after_sign_in_path_for(current_user), notice: "Invalid Details") if @department.nil?
  end

  def set_scheme
    @scheme = Scheme.find_by_id(params[:scheme_id])
    (return redirect_to after_sign_in_path_for(current_user), notice: "Invalid Details") if @scheme.nil?
  end
end