class YamrsMailer < ApplicationMailer
  default from: 'YAMRs.Team@gmail.com'

# Rails will send the matching view, no need to specify
  def welcome_email(user)
    @user=user
    mail(to: @user.email, subject: 'Welcome to YAMRs!')
  end

  def welcome_gmail(user,password)
    @user=user
    @password=password
    mail(to: @user.email, subject: 'Welcome to YAMRs!')
  end
end
