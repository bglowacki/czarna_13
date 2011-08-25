ActionMailer::Base.delivery_method = :smtp 


ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => 'czarna-13.org',
  :user_name => 'czarna.trzynastka@czarna-13.org',
  :password => 'Bart1398#',
  :authentication => :login,
}