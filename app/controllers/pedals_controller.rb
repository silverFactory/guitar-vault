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

  get '/pedals/:id' do
    @pedal = Pedal.find(params[:id])
    if session[:user_id] == @pedal.user_id
      erb :'/pedals/show'
    else
      redirect '/'
    end
  end

  get '/pedals/:id/edit' do
    @pedal = Pedal.find(params[:id])
    #@manufacturer = @pedal.manufacturer
    if session[:user_id] == @pedal.user_id
      erb :'/pedals/edit'
    else
      redirect '/'
    end
  end

  patch '/pedals/:id' do
    @pedal = Pedal.find(params[:id])
    @pedal.update(params[:pedal])
    @manufacturer = Manufacturer.find_or_create_by(name: params[:manufacturer])
    @pedal.manufacturer_id = @manufacturer.id
    @pedal.save
    redirect "/pedals/#{@pedal.id}"
  end

  post '/pedals/:id/delete' do
    @pedal = Pedal.find(params[:id])
    @pedal.destroy
    redirect '/pedals'
  end

end
