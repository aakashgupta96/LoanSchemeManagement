class TicketsController < ApplicationController
  before_action :authenticate_user
 
  def authenticate_user
  	@user = current_user
  	if @user
  		return true
  	else
  		return redirect_to sign_in_user_path
  	end
  end
 
 	def index
  	@users = User.all
  	@tickets = Tickets.all
  	@departments = Department.all
  end
 
 	def create
  	# if Ticket.between(params[:sender_id],params[:recipient_id]).present?
   #  	@conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
  	# else
   	@ticket = Ticket.create(ticket_params)
   	return redirect_to tickets_messages_path(@ticket)
  	# end
  	# 	redirect_to conversation_messages_path(@conversation)
 	end
 
 	private
 
  def ticket_params
   	params.permit(:current_user_id, :description, :department_id)
  end

end 