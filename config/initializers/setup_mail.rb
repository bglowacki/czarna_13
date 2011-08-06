ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "czarna-13.org",
  :user_name            => "czarna.trzynastka",
  :password             => "czarna-13#",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "czarna-13.org"