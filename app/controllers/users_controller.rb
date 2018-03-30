class UsersController < ApplicationController

	before_action :set_user, only: [:create_session]
	before_action :user_enabled?, only: [:create_session]
	def sign_up
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.disabled
			@user.role = User.roles["scheme_provider"]
		end
		if @user.save
			(session["user_id"] = @user.id) unless @user.disabled
			return redirect_to after_sign_in_path_for(@user), notice: "Account successfully created!"
		else
			return redirect_to sign_in_user_path, notice: "Some error occurred while saving details. Please try again!"
		end
	end

	def sign_in #Shows sign in form only
		(return redirect_to after_sign_in_path_for(current_user), notice: "Already Signed In!") if current_user
	end

	def create_session
		session["user_id"] = @user.id
		return redirect_to after_sign_in_path_for(@user), notice: "Logged in successfully!"
	end

	def sign_out
		session["user_id"] = nil
		return redirect_to sign_in_user_path, notice: "Logged out successfully!"
	end

	def edit
		@user = User.find_by_reset_password_token(params["reset_password_token"])
		(return redirect_to sign_in_user_path, notice: "Can't find account corresponding to the link!") if (@user.nil? || params["reset_password_token"].empty? || params["reset_password_token"].nil?)
	end

	def update
		@user = User.find_by_email(params[:user][:email])
		unless @user
			return redirect_to sign_in_user_path, notice: "Invalid details. Please try again!"
		end
		@user.update(user_params)
		@user.update(reset_password_token: nil) #To disable password reset link
		return redirect_to sign_in_user_path, notice: "Password reset was successful"
	end


	private

	def set_user
		@user = User.with_details(user_params)
		unless @user
			return redirect_to sign_in_user_path, notice: "Invalid details. Please try again!"
		end
	end

	def user_params
		 params.require(:user).permit(:email, :password, :name, :disabled)
	end

	def user_enabled?
		if @user.disabled
			return redirect_to sign_in_user_path, notice: "Account disabled"
		else
			true
		end
	end

end