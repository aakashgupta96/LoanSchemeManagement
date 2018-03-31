class TicketsController < ApplicationController
 
 	# before_action :set_ticket, only: [:change_stauts]
 	def index
    @user = current_user
  	@users = User.all
  	# @department = Department.find_by_user_id(current_user.id)
    if current_user.nodal_employee?
      @department = current_user.works_for
    else
      @department = Department.find_by_user_id(current_user.id)
    end
    # @tickets = Ticket.find_by_department_id(@department.id)
    @tickets = @department.tickets
  end
 
  def open_change_status
  	t = Ticket.find(params[:id])
  	t.open!
  	return redirect_to tickets_index_path
	end

	def resolved_change_status
		t = Ticket.find(params[:id])
  	t.resolved!
  	return redirect_to tickets_index_path
	end

	def escalated_change_status	
		t = Ticket.find(params[:id])
  	t.escalated!
  	return redirect_to tickets_index_path
	end
 	

end 