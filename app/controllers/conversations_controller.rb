class ConversationsController < ApplicationController
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
 		@conversations = Conversation.all
 	end

	def create
 		if Conversation.between(params[:sender_id],params[:recipient_id]).present?
    	@conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
 		else
  		@conversation = Conversation.create!(conversation_params)
 		end
 		redirect_to conversation_messages_path(@conversation)
	end

	private

 	def conversation_params
  	params.permit(:sender_id, :recipient_id)
 	end
end