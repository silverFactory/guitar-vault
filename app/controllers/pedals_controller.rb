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
    if pedal_valid?(params)
      @pedal = Pedal.new(params[:pedal])
      @manufacturer = Manufacturer.find_or_create_by(name: params[:manufacturer])
      @pedal.manufacturer = @manufacturer
      @pedal.user_id = session[:user_id]
      @pedal.save
      redirect "/pedals/#{@pedal.id}"
    else
      redirect "/pedals/new"
    end
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
    if session[:user_id] == @pedal.user_id
      erb :'/pedals/edit'
    else
      redirect '/'
    end
  end

  patch '/pedals/:id' do
    if pedal_valid?(params)
      @pedal = Pedal.find(params[:id])
      @pedal.update(params[:pedal])
      @manufacturer = Manufacturer.find_or_create_by(name: params[:manufacturer])
      @pedal.manufacturer_id = @manufacturer.id
      @pedal.save
      redirect "/pedals/#{@pedal.id}"
    else
      redirect "/pedals/#{@pedal.id}/edit"
    end
  end

  post '/pedals/:id/delete' do
    @pedal = Pedal.find(params[:id])
    @pedal.destroy
    redirect '/pedals'
  end

  def pedal_valid?(params)
    if params[:pedal][:name] != "" && params[:pedal][:effect_type] != "" && params[:pedal][:power_supply] != "" && params[:manufacturer] != ""
      true
    else
      false
    end
  end
end
