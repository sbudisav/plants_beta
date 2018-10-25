class UserPlant < ApplicationRecord
  belongs_to :plant 
  belongs_to :user 
  require 'date'

  
  enum sun_placement: {low: 1, med: 2, high: 3}

  def reminder(last_water)
    last_water = Date.parse(last_water)
    today = Date.today
    days_since = today - last_water
    puts "it has been this many days"
    puts how_long_has_this_been_going_on

    if days_since > self.plant.water_freq
      puts "the reminder goes here to let you know"
    end
  end

  def friendly_watered_at
    created_at.strftime("%m/%d")
  end

end
