class Ticket < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  belongs_to :department

  enum status: {new_ticket: 0, open: 1, resolved: 2, escalated: 3}
end
