class GuitarsController < ApplicationController

  get '/guitars' do
    if logged_in?
      @user = User.find(session[:user_id])
      @guitars = @user.guitars
      erb :'/guitars/index'
    else
      redirect '/'
    end
  end

  get '/guitars/new' do
    if logged_in?
      erb :'/guitars/new'
    else
      redirect '/'
    end
  end

  post '/guitars/new' do
    if guitar_valid?(params)
      @guitar = Guitar.new(model: params[:model], category: params[:category], user_id: session[:user_id])
      @manufacturer = Manufacturer.find_or_create_by(name: params[:manufacturer])
      @guitar.manufacturer = @manufacturer
      @guitar.save
      redirect "/guitars/#{@guitar.id}"
    else
      redirect '/guitars/new'
    end
  end

  get '/guitars/:id' do
    @guitar = Guitar.find(params[:id])
    if session[:user_id] == @guitar.user_id
      erb :'/guitars/show'
    else
      redirect '/'
    end
  end

  get '/guitars/:id/edit' do
    @guitar = Guitar.find(params[:id])
    @manufacturer = @guitar.manufacturer
    if session[:user_id] == @guitar.user_id
      erb :'/guitars/edit'
    else
      redirect '/'
    end
  end

  patch '/guitars/:id' do
    if guitar_valid?(params)
      @guitar = Guitar.find(params[:id])
      @guitar.update(params[:guitar])
      @manufacturer = Manufacturer.find_or_create_by(name: params[:manufacturer])
      @guitar.manufacturer_id = @manufacturer.id
      @guitar.save
      redirect "/guitars/#{@guitar.id}"
    else
      redirect "/guitars/#{@guitar.id}/edit"
    end
  end

  post '/guitars/:id/delete' do
    @guitar = Guitar.find(params[:id])
    @guitar.destroy
    redirect '/guitars'
  end

  def guitar_valid?(params)
    if guitar[:model] != "" && guitar[:category] != "" && params[:manufacturer] != ""
      true
    else
      false
    end
  end
end
