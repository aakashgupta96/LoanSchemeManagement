class DepartmentEmployee < ActiveRecord::Base

	belongs_to :employee, class_name: 'User', foreign_key: :user_id
	belongs_to :department, class_name: 'Department', foreign_key: :user_id

end
