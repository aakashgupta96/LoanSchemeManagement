class Department < ActiveRecord::Base
	
	belongs_to :officer, class_name: "User", foreign_key: :user_id
	accepts_nested_attributes_for :officer, allow_destroy: true

end
