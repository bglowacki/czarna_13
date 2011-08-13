ActionMailer::Base.delivery_method = :smtp 


ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => 'czarna-13.org',
  :user_name => 'bglowacki@czarna-13.org',
  :password => 'Bart1398#',
  :authentication => :plain,
  :enable_starttls_auto => false
}