class UserMailer < ApplicationMailer

	def test(email)
		mail(to: email, subject: "test mail")
	end

	def reset_password_instructions(user)
		@user = user
		mail(to: @user.email, subject: "Reset Account Password")
	end

end