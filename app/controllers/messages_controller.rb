class MessagesController < ApplicationController
  before_action do
    @ticket = Ticket.find(params[:ticket_id])
  end

  def index
    @messages = @ticket.messages
  end

  def new
    @message = @ticket.messages.new
  end

  def create
    @message = @ticket.messages.new(message_params)
    if @message.save
      redirect_to ticket_messages_path(@ticket)
    end
  end

private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
  
end