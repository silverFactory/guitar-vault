class AmpsController < ApplicationController

  get '/amps' do
    if logged_in?
      @user = User.find(session[:user_id])
      @amps = @user.amps
      erb :'/amps/index'
    else
      redirect '/'
    end
  end

  get '/amps/new' do
    if logged_in?
      erb :'/amps/new'
    else
      redirect '/'
    end
  end


end
