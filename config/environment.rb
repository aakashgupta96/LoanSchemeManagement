# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    address:              'smtp.gmail.com', #'email-smtp.us-west-2.amazonaws.com',
    port:                 587,
    user_name:            ENV["GMAIL_USERNAME"],
  	password:             ENV["GMAIL_PASSWORD"],
    authentication:       :login,#:plain,
    enable_starttls_auto: true
}
