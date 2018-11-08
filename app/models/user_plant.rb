class UserPlant < ApplicationRecord
  belongs_to :plant 
  belongs_to :user 
  require 'date'

  
  enum sun_placement: {low: 1, med: 2, high: 3}

  def formatted_last_water
    if last_watered.present? 
      last_watered.strftime("%a %b%e")
    end
  end

  def days_since
    days = DateTime.now.to_date - last_watered.to_date
    days.to_i
  end

end
