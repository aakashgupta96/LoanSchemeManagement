module Api
  module V1
    class UsersApiController < ::ApiController
      before_action :authenticate_user, except: [:login]

      def login
        email = params[:email]
        password = params[:password]

        user = User.find_by_email email
        if user
          if user.password != password
            return throw_wrong_credentials
          end
          user.update access_token: SecureRandom.hex
        else
          user = User.create email: email, password: password, access_token: SecureRandom.hex
        end

        data = Hash.new
        data[:user] = user
        data[:user_access_token] = user.access_token
        response_data data, "User Logged In", 200
      end

      def logout
        data = Hash.new
        @current_user.update access_token: nil
        response_data data, "You are logged out", 200
      end
    end
  end
end
