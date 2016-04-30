Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], {
  scope: ['email',
    #just want for authentication, send seems like least info from user
    'https://www.googleapis.com/auth/gmail.send'], 
    access_type: 'offline'}
end
