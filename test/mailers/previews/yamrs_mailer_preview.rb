# Preview all emails at http://localhost:3000/rails/mailers/yamrs_mailer
class YamrsMailerPreview < ActionMailer::Preview
  def welcome_email_preview
    YamrsMailer.welcome_email(User.first)
  end
end
