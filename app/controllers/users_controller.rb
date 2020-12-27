class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "/users/#{@user.id}"
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    if valid_signup?(params[:user])
      @user = User.create(params[:user])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect "/users/#{session[:user_id]}"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect "/login"
    end
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    if session[:user_id] == @user.id
      @user = User.find(params[:id])
      @guitars = @user.guitars
      @pedals = @user.pedals
      @amps = @user.amps
      erb :'/users/index'
    else
      redirect '/'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
