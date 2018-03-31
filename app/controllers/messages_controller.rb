class MessagesController < ApplicationController
  before_action do
    @ticket = Ticket.find_by_id(params[:ticket_id])
  end

  def index
    @messages = @ticket.messages
    @current_user = current_user
  end
  
  def new
    @message = @ticket.messages.new
  end

  def create
    @message = @ticket.messages.new(message_params)
    if @message.save
      if @message.user.applicant? && @message.ticket.status.escalated?
        @message.user.doubt_resolved
      end
      redirect_to ticket_messages_path
    else
    	redirect_to tickets_index_path
    end
  end

private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end