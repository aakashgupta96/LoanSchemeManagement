class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :ticket

  validates_presence_of :body, :ticket_id, :user_id
end
