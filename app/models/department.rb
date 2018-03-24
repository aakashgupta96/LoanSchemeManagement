class Department < ActiveRecord::Base
	
	belongs_to :officer, class_name: "User", foreign_key: :user_id
	accepts_nested_attributes_for :officer, allow_destroy: true
	has_many :schemes

	def add_officer 
		u = User.find()
	end

end
