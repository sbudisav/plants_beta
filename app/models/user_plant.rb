class UserPlant < ApplicationRecord
  has_one_attached :image
  belongs_to :plant 
  belongs_to :user 
  require 'date' 

  
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
      return (out - 1)
    elsif sun_placement === "low"
      return (out +1)
    else 
      return out
    end
  end

end
