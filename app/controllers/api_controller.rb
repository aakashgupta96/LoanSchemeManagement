class ApiController < ActionController::API

  include ActionController::HttpAuthentication::Token::ControllerMethods

  private

  def response_data(data, message, status, error: nil, disabled: false, update: false, params: {})
    result = Hash.new
    result[:data] = data
    result[:message] = message
    result[:status] = status
    result[:error] = error
    result[:disabled] = disabled
    result[:update] = update
    render json: result, params: params, status: status
  end

  def authenticate_user
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by_access_token(token)
      if token && @current_user.nil?
        return throw_login
      end
      return throw_unauthorised if (@current_user && @current_user.disabled)
    end
  end

  def throw_login
    error = Entities::Error.new
    error.code = 101
    error.message = "You need to login"
    return response_data(nil, "You need to login", 200, error: error)
  end

  def throw_unauthorised
    error = Entities::Error.new
    error.code = 401
    error.message = "You are not authorised"
    return response_data(nil, "You are not authorised", 401, error: error)
  end
end