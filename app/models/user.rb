class User < ActiveRecord::Base
	has_one :department, dependent: :destroy
	has_one :company
	enum role: {applicant: 0, officer: 1, admin: 2, nodal_employee: 3, scheme_provider: 4}

	def self.with_details(user_hash)
		@user = find_by_email_and_password(user_hash["email"],user_hash["password"])
	end

	def works_for
		if self.nodal_employee?
			d_id = (DepartmentEmployee.where(user_id: self.id).first.department_id rescue nil)
			Department.find_by_id(d_id)
		end
	end

	def self.with_email(email)
		User.where(email: email).first_or_initialize do |user|
			user.email = email
		end
	end

	def send_reset_password_instructions
		self.update(reset_password_token: SecureRandom.hex)
		UserMailer.reset_password_instructions(self).deliver_now
	end

	def as_json(options = {})
		UserSerializer.new(self).as_json(root: false)
	end
end
