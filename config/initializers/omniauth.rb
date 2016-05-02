Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], {
  scope: ['email',
    #Just want for authentication, insert seems like least info from user
    # Would have used google sign-in (don't really need mail stuff), but gmail was specified
    'https://www.googleapis.com/auth/gmail.insert'], 
    access_type: 'offline'}
end
