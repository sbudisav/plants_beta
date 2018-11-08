json.id user_plant.id
json.plant_id user_plant.plant_id
json.nickname user_plant.nickname
json.plant user_plant.plant.name 
json.last_watered user_plant.last_watered
json.sun_placement user_plant.sun_placement
json.water_freq user_plant.plant.water_freq

json.formatted do
  json.formatted_last_water user_plant.formatted_last_water
  json.days_since user_plant.days_since
end