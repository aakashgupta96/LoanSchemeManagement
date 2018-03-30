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
	end

	def resolved_change_status
  	t = Ticket.find(params[:id])
  	t.resolved!
	end

	def escalated_change_status
  	t = Ticket.find(params[:id])
  	t.escalated!
	end
 	

end 