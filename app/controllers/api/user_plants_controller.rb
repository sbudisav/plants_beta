class Api::UserPlantsController < ApplicationController
  before_action :authenticate_user

  def index
    @user_plants = UserPlant.where(user_id: current_user.id)
    render 'index.json.jbuilder'
  end

  def create 
    @user_plant = UserPlant.new(
                                plant_id: params[:plant_id],
                                nickname: params[:nickname],
                                user_id: current_user.id,
                                last_watered: params[:last_watered],
                                sun_placement: params[:sun_placement]
                                )

    @user_plant.save

  end
end
