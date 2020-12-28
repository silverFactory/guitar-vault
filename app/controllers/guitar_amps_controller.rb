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
      if amp_valid?(params)
        @amp = Amp.new(params[:amp])
        @manufacturer = Manufacturer.find_or_create_by(name: params[:manufacturer])
        @amp.manufacturer = @manufacturer
        @amp.user_id = session[:user_id]
        @amp.save
        redirect "/amps/#{@amp.id}"
      else
        redirect '/amps/new'
      end
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
    if amp_valid?(params)
      @amp = Amp.find(params[:id])
      @amp.update(params[:amp])
      @manufacturer = Manufacturer.find_or_create_by(name: params[:manufacturer])
      #binding.pry
      @amp.manufacturer_id = @manufacturer.id
      @amp.save
      redirect "/amps/#{@amp.id}"
    else
      redirect "/amps/#{@amp.id}/edit"
    end
  end

  post '/amps/:id/delete' do
    @amp = Amp.find(params[:id])
    @amp.destroy
    redirect '/amps'
  end

  def amp_valid?(params)
    if amp[:name] != "" && amp[:power_type] != "" && amp[:watts] != "" && amp[:channels] != "" && amp[:num_speakers] != "" && amp[:speaker_size] != "" && params[:manufacturer] != ""
      true
    else
      false
    end
  end
end
