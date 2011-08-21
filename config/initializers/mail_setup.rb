ActionMailer::Base.delivery_method = :smtp 


ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 25,
  :domain => 'czarna-13.org',
  :user_name => 'czarna.trzynastka@czarna-13.org',
  :password => 'czarna1398',
  :authentication => :plain,
  :enable_starttls_auto => true
}