class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize
  
  delegate :allow?, to: :current_permission
  helper_method :allow?

  delegate :allow_param?, to: :current_permission
  helper_method :allow_param?

  def after_sign_in_path_for(resource)
  	if resource.applicant?
  		"/users/dashboard"
  	elsif resource.officer?
  		"/officers/dashboard"
    elsif resource.nodal_employee?
      "/nodal_employees/dashboard"
  	elsif resource.scheme_provider?
      "/scheme_providers/dashboard"
    else
  		"/admins/dashboard"
  	end
  end

  def current_user
  	@user = User.find_by_id(session["user_id"])
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

  private

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorize
    if !current_permission.allow?(params[:controller], params[:action])
      redirect_to root_url, alert: "Not authorized."
    end
  end

end
