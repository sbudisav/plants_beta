class Api::UsersController < ApplicationController

require 'net/http'

  def create
    user = User.new(
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @user = User.find(params[:id])
    @user.location = params[:location] || @user.location
  end

  def get_humidity 
    humidity = 0
    status = 0
    city = ""
    url = "http://api.openweathermap.org/data/2.5/weather?zip=#{location},us,units=imperial&APPID=#{ENV['HUMIDITY_API_KEY']}"
    uri = URI(URI.encode(url))
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)
    if json.key?('cod')
      status = json['cod']
    end
    if status == '200' || status == 200
      humidity = json['list'][0]['main']['humidity']
      city = json['city']['name']
    end
    humidity: humidity
  end
end
