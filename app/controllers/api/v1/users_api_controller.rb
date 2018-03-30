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

      def edit_details
        if params["image"]
          data_uri_parts = params["image"].match(/\Adata:([-\w]+\/[-\w\+\.]+)?;base64,(.*)/m) || []
          extension = MIME::Types[data_uri_parts[1]].first.preferred_extension
          user = @current_user
          file_name = 'profile' + user.id.to_s + SecureRandom.hex + '.' + extension

          File.open(Rails.root.join('public', 'uploads', file_name).to_s, 'wb') do |file|
            file.write(Base64.decode64(data_uri_parts[2]))
          end
          file_path = "#{Rails.root}/public/uploads/#{file_name}"
          user.image = send_to_amazon(file_path)
        end
        user.name = params["name"] if params["name"]
        user.phone = params["phone"] if params["phone"]
        user.address = params["address"] if params["address"]
        user.save
        data = Hash.new
        data[:user] = user
        File.delete file_path
        response_data data, "Profile Updated", 200
      end
    end
  end
end
