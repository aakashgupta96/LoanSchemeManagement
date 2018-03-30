class MessagesController < ApplicationController
  before_action do
    @ticket = Ticket.find(params[:ticket_id])
  end

  def index
    @messages = @ticket.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end

    @message = @ticket.messages.new
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