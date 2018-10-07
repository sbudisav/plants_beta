class Api::PlantsController < ApplicationController
  def index 
    @plants = Plant.all
    render 'index.json.jbuilder'
  end

  def create
    @plant = Plant.new(name: params[:name],
                       bionominal: params[:bionominal],
                       water_freq: params[:water_freq],
                       sun_pref: params[:sun_pref],
                       fertilizer_freq: params[:fertilizer_freq],
                       description: params[:description]
                      )
    if @plant.save
      render "show.json.jbuilder"
    else
      render json: {errors: @plant.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @plant = Plant.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update 
    @plant = Plant.find(params[:id])
    @plant.name = params[:name] || @plant.name
    @plant.bionominal = params[:bionominal] || @plant.bioinominal 
    @plant.description = params[:description] || @plant.description
    @plant.sun_pref = params[:sun_pref] || @plant.sun_pref
    @plant.water_freq = params[:water_freq] || @plant.water_freq

    if @plant.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    render json: {message: "Deleted"}
  end

end
