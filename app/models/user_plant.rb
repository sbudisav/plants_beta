class UserPlant < ApplicationRecord
  has_one_attached :image
  belongs_to :plant 
  belongs_to :user 
  require 'date' 
  attr_reader :message

  
  enum sun_placement: {low: 1, med: 2, high: 3}

  def formatted_last_water
    if last_watered.present? 
      last_watered.strftime("%a, %b %e")
    end
  end

  def days_since
    days = DateTime.now.to_date - last_watered.to_date
    days.to_i
  end

  def next_water
    water = last_watered + plant.water_freq.days
    water
  end

  def next_water_formatted
    next_water.strftime("%a, %b %e")
  end


  def days_till
    till = next_water.to_date - Date.today
    out = till.to_i
    if sun_placement === "high"
      out = out - 1
    else sun_placement === "low"
      out = out + 1
    end
    if user.humidity
      if user.humidity < 50
        out = out - 1
      else user.humidity > 90
        out = out + 1
      end
    end

    puts "**********************************"
    puts "Day until next water (negative is bad)"
    puts out
    puts "**********************************"
    puts "ALL USER PLANTS SHOULD BE DISPLAYED HERE"
    puts plant.name
  end
  def trouble_plants
    trouble_plants = []
    if days_till < -14
     trouble_plants << "#{plant.nickname} the #{plant.name}"
    end
    puts trouble_plants
    return out
  end

  def warning_text
    trouble_plants = []

    # if days_till < -14
    #   trouble_plants << "#{plant.nickname} the #{plant.name}"
    # end
    # if trouble_plants.length >= 1
    #   trouble_plants = "The following plants are over 2 weeks overdue for water! We reccomend watering them as soon as possible!"
    # end
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.twilio_phone_number,
      to: '17192425869',
      body: message_body
    })
  end

end
