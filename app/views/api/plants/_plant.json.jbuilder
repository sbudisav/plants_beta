json.id plant.id
json.name plant.name
json.bionominal plant.bionominal
json.description plant.description
json.sun_pref plant.sun_pref
json.water_freq plant.water_freq
json.default_image_url plant.default_image_url


json.images do
  json.array! plant.images, partial: 'api/images/image', as: :image
end