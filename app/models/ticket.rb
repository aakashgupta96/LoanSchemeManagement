class Ticket < ActiveRecord::Base
  belongs_to :user
  has_many :messages, dependent: :destroy
  belongs_to :department

  after_create :set_status

  enum status: {new_ticket: 0, open: 1, resolved: 2, escalated: 3}

	def set_status
  	self.status = Ticket.statuses["new_ticket"]
  end

end
