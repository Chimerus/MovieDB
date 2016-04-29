class YamrsMailer < ApplicationMailer
  default from: 'YAMRs.Team@gmail.com'

  def welcome_email(user)
    @user=user
    mail(to: @user.email, subject: 'Welcome to YAMRs!')
  end
end
