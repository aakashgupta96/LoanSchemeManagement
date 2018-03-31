class ApiController < ActionController::API

  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :cors_preflight_check
  before_action :cors_set_access_control_headers
  serialization_scope :view_context

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers, Authorization'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers, Authorization'
    headers['Access-Control-Max-Age'] = "1728000"
  end

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

  def throw_wrong_credentials
    error = Entities::Error.new
    error.code = 400
    error.message = "You have put wrong credentials"
    return response_data(nil, "You have put wrong credentials", 200, error: error)
  end

  def throw_unauthorised
    error = Entities::Error.new
    error.code = 401
    error.message = "You are not authorised"
    return response_data(nil, "You are not authorised", 401, error: error)
  end

  def send_to_amazon(file_path)
    file_name = File.basename(file_path)
    bucket = 'loanscheme'
    s3 = AWS::S3.new(:access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'], :region => 'ap-south-1')
    obj = s3.buckets[bucket].objects[file_name]
    obj.write(Pathname.new(file_path))
    s3.client.put_object_acl({acl: "public-read", bucket_name: bucket, key: obj.key})
    obj.public_url.to_s
  end
end