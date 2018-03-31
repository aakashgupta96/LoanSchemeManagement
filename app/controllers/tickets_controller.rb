class TicketsController < ApplicationController
 
 	# before_action :set_ticket, only: [:change_stauts]
 	def index
  	@users = User.all
  	@tickets = Ticket.all
  	@departments = Department.all
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