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

end
