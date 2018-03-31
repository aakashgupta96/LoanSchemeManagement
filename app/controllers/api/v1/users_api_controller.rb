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

      def add_company
        image = nil
        if params["image"]
          data_uri_parts = params["image"].match(/\Adata:([-\w]+\/[-\w\+\.]+)?;base64,(.*)/m) || []
          extension = MIME::Types[data_uri_parts[1]].first.preferred_extension
          file_name = 'company' + SecureRandom.hex + '.' + extension

          File.open(Rails.root.join('public', 'uploads', file_name).to_s, 'wb') do |file|
            file.write(Base64.decode64(data_uri_parts[2]))
          end
          file_path = "#{Rails.root}/public/uploads/#{file_name}"
          image = send_to_amazon(file_path)
        end
        company = Company.create name: params[:name], user_id: @current_user.id, incorporation_date: params[:incorporation_date],
                                 incorporation_number: params[:incorporation_number], company_type: params[:type],
                                 description: params[:description], team_strength: params[:team_strength],
                                 location: params[:location], growth_rate: params[:growth_rate],
                                 pan: params[:pan], contact_number: params[:phone], website: params[:website],
                                 net_worth: params[:net_worth], profits: params[:profits], image: image

        data = Hash.new
        data[:company] = company
        response_data data, "Company Added", 200
      end

      def load_data
        data = Hash.new
        data[:departments] = Department.all
        data[:ministries] = Ministry.all
        data[:schemes] = Scheme.all
        response_data data, "Data", 200
      end

      def ask_query
        ticket = Ticket.new
        ticket.description = params[:description]
        ticket.user = @current_user
        ticket.department_id = params[:department_id]
        ticket.save
        data = Hash.new
        data[:ticket] = ticket
        response_data data, "Data", 200
      end

      def apply_for_loan

      end
    end
  end
end
