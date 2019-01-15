class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true

  has_many :user_plants

  require 'httparty'

  def humidity 
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=#{location},us&units=imperial&APPID=#{ENV['HUMIDITY_API_KEY']}")
    humidity_level = response["main"]["humidity"]
    return humidity_level
  end

  def city 
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=#{location},us&units=imperial&APPID=#{ENV['HUMIDITY_API_KEY']}")
    city_name = response["name"]
    return city_name
  end

end
