class Ministry < ActiveRecord::Base

	has_many :departments

	accepts_nested_attributes_for :departments, :allow_destroy => true

end
