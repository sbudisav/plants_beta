class Plant < ApplicationRecord
  has_many :images
  has_many :user_plants

  enum sun_pref: {low: 1; :med 2, high: 3}
end
