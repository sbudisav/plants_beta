class Api::UserPlantsController < ApplicationController
  before_action :authenticate_user

  def index
    @user_plants = current_user.user_plants.order(:created_at)
    render 'index.json.jbuilder' 
  end

  def show
    @user_plants = UserPlant.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create 
    @user_plant = UserPlant.new(
                                plant_id: params[:plant_id],
                                image: params[:image],
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
    @user_plant.sun_placement = params[:sun_placement] || @user_plant.sun_placement
    @user_plant.image = @user_plant.image.attach(params[:image]) if params[:image]

    formatted_last_watered = (Date.today - params[:last_watered].to_i.days) if params[:last_watered]
    @user_plant.last_watered = formatted_last_watered || @user_plant.last_watered

    if @user_plant.save
      @user_plants = current_user.user_plants.order(:created_at)
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
