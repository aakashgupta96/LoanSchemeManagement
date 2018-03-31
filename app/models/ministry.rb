class Ministry < ActiveRecord::Base

	has_many :departments

	accepts_nested_attributes_for :departments, :allow_destroy => true

	def as_json(options = {})
		MinistrySerializer.new(self).as_json(root: false)
	end
end
