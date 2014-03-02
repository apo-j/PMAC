# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
PMAC::Application.initialize!

PMAC::Application.configure do
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
      address: "smtp.gmail.com",
      port: 587,
      domain: "pmac.com",
      authentication: "plain",
      user_name: "ijiyun.yang@gmail.com",
      password: "04040501",
      enable_starttls_auto: true
  }
end