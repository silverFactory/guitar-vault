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

  post '/amps/new' do
    @amp = Amp.new(params[:amp])
    @manufacturer = Manufacturer.find_or_create_by(name: params[:manufacturer])
    @amp.manufacturer = @manufacturer
    @amp.user_id = session[:user_id]
    @amp.save
    redirect "/amps/#{@amp.id}"
  end

  get '/amps/:id' do
    @amp = Amp.find(params[:id])
    if session[:user_id] == @amp.user_id
      erb :'/amps/show'
    else
      redirect '/'
    end
  end

  get '/amps/:id/edit' do
    @amp = Amp.find(params[:id])
    #@manufacturer = @amp.manufacturer
    if session[:user_id] == @amp.user_id
      erb :'/amps/edit'
    else
      redirect '/'
    end
  end

  patch '/amps/:id' do
    @amp = Amp.find(params[:id])
    @amp.update(params[:amp])
    @manufacturer = Manufacturer.find_or_create_by(name: params[:manufacturer])
    #binding.pry
    @amp.manufacturer_id = @manufacturer.id
    @amp.save
    redirect "/amps/#{@amp.id}"
  end

  post '/amps/:id/delete' do
    @amp = Amp.find(params[:id])
    @amp.destroy
    redirect '/amps'
  end

end
