class Plant < ApplicationRecord
  has_many :images
  has_many :user_plants

  enum sun_pref: {low: 1, med: 2, high: 3}

  def default_image_url
    if images.any?
      images.first.url
    else
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOhVquEaQvVWSbp4CxfXNytpCmRA47r0q5GwzofmhmFiYo7_q"
    end
  end
end
 