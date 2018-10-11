class UserPlant < ApplicationRecord
  belongs_to :plant 
  belong_to :user 
  
end
