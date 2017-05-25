class Usermailer < ApplicationMailer
  class UserMailer < ActionMailer::Base
  default from: 'from@example.com'

  def welcome_email(user)
    # your code here
    @user = user
   @url  = 'http://example.com/session/new'
   mail(to: user.username, subject: 'Welcome to 99 Cats')
  end
end
end
