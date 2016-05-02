class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in? 
    def current_user
      @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    end

    def logged_in?
      current_user != nil
    end

    def login
      user = User.where(email: params[:email]).first
      if user && user.authenticate(params[:password])
        cookies[:auth_token] = user.auth_token
        redirect_to :back
      else
        flash[:error] = "Invalid email or password"
        redirect_to '/'
      end
    end

    # clear session
    def logout
      cookies.delete(:auth_token)
      redirect_to '/'
    end

    def create
      @auth = request.env['omniauth.auth']['credentials']
      @auth2 = request.env['omniauth.auth']['info']
      new_token = Token.create(
      access_token: @auth['token'],
      refresh_token: @auth['refresh_token'],
      expires_at: Time.at(@auth['expires_at']).to_datetime,
      email: @auth2['email'])

      # if existing user
      if User.find_by(email: new_token.email)
        # log them in
        user = User.where(email: new_token[:email]).first
        cookies[:auth_token] = user.auth_token
      # make a new user
      else 
        random_password = SecureRandom.hex(5)
        oauth_user = User.new(
          username: @auth2['email'],
          email: @auth2['email'],
          password: random_password, 
          picture: @auth2['image']
          )
        # log them in
        if oauth_user.save
          # welcome them and send them their access information
          YamrsMailer.welcome_gmail(oauth_user,random_password).deliver
          user = User.where(email: oauth_user[:email]).first
          # this is their "logged in"
          cookies[:auth_token] = user.auth_token
        end
      end
      redirect_to '/'
    end

end
