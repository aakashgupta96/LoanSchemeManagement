class UserMailer < ApplicationMailer

	def test(email)
		mail(to: email, subject: "test mail")
	end

	def reset_password_instructions(user)
		@user = user
		mail(to: @user.email, subject: "Reset Account Password")
	end

	def doubt_resolved(user)
		@user = user
		msil(to: @user.email, subject: "Your doubt has been resolved by Nodal Officer")
	end

end