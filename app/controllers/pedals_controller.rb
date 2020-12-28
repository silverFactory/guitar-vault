class PedalsController < ApplicationController

  get '/pedals' do
    if logged_in?
      @user = User.find(session[:user_id])
      @pedals = @user.pedals
      erb :'/pedals/index'
    else
      redirect '/'
    end
  end

  get '/pedals/new' do
    if logged_in?
      erb :'/pedals/new'
    else
      redirect '/'
    end
  end

  post '/pedals/new' do
    @pedal = Pedal.new(params[:pedal])
    @manufacturer = Manufacturer.find_or_create_by(name: params[:manufacturer])
    @pedal.manufacturer = @manufacturer
    @pedal.save
    redirect "/pedals/#{@pedal.id}"
  end


end
