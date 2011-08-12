ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  #:domain => 'www.czarna-13.org',
  :user_name => 'marathone@gmail.com',
  :password => 'Bartolomeo1398#',
  :authentication => 'plain',
  :enable_starttls_auto => true
}