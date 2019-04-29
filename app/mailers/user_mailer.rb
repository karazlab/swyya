class UserMailer < ApplicationMailer
  default from: 'labkaraz@gmail.com'

  def welcome(user)
    subject     = "Warm Welcome, It's time to share your work"
    @username   = user.username
    mail to: user.email, subject: subject
  end
end
