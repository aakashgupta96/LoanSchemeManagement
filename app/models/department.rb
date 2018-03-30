class Department < ActiveRecord::Base
	
	belongs_to :officer, class_name: "User", foreign_key: :user_id
	belongs_to :ministry
	has_many :schemes
	has_many :department_employees, class_name: "DepartmentEmployee", foreign_key: "department_id"
	has_many :employees, through: :department_employees
	
	accepts_nested_attributes_for :officer, allow_destroy: true
	
end
