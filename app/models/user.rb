class User < ActiveRecord::Base
	has_one :department
	enum role: {applicant: 0, officer: 1, admin: 2, helper: 3, back_user: 4}

	def self.with_details(user_hash)
		@user = find_by_email_and_password(user_hash["email"],user_hash["password"])
	end

	def send_reset_password_instructions
		self.update(reset_password_token: SecureRandom.hex)
		UserMailer.reset_password_instructions(self).deliver_now
	end

	def as_json(options = {})
		UserSerializer.new(self).as_json(root: false)
	end
end
