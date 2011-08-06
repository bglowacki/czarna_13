class UserMailer < ActionMailer::Base
  
  def registration_confirmation(user)
    mail(:to => user.email, :subject => "Zarejestrowano", :from => "czarna.trzynastka@czarna-13.org")
  end
end
