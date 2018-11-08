class Api::UserPlantsController < ApplicationController
  before_action :authenticate_user

  def index
    @user_plants = UserPlant.where(user_id: current_user.id)
    render 'index.json.jbuilder'
  end

  def show
    @user_plants = UserPlant.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create 
    @user_plant = UserPlant.new(
                                plant_id: params[:plant_id],
                                user_id: current_user.id,
                                nickname: "un-named",
                                last_watered: DateTime.now,
                                sun_placement: "low"
                                )

    if @user_plant.save
      render "index.json.jbuilder"
    else
      render json: {errors: @user_plant.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def update
    @user_plant = UserPlant.find(params[:id])
    @user_plant.nickname = params[:nickname] || @user_plant.nickname
    @user_plant.last_watered = params[:last_watered] || @user_plant.last_watered
    @user_plant.sun_placement = params[:sun_placement] || @user_plant.sun_placement

    if @user_plant.save
      render "index.json.jbuilder" 
    else
      render json: {errors: @user_plant.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @user_plant = UserPlant.find(params[:id])
    @user_plant.destroy
    render json: {status: "Plant removed"}
  end
end
