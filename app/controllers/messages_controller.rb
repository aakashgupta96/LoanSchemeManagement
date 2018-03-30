class MessagesController < ApplicationController
  before_action do
    @ticket = Ticket.find(params[:ticket_id])
  end

  def index
    @messages = @ticket.messages
  end
  
end