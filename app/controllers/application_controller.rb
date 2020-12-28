class ApplicationController < Sinatra::Base
    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      enable :sessions
      set :session_secret, "secret"
    end

  get '/' do
    if logged_in?
      redirect "/users/#{session[:user_id]}"
    else
      erb :'index'
    end
  end

  def valid_signup?(params)
    if params[:username] != "" && params[:email] != "" && params[:password] != ""
      true
    else
      false
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end
end
