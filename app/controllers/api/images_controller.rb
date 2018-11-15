class Api::ImagesController < ApplicationController
  
  def index
    @images = Image.all
    render 'index.json.jbuilder'
  end

  def create
    @image = Image.new(url: params[:url],
                       plant_id: params[:plant_id],
                       alt: params[:alt])
    if @image.save
      render json: {message: "Image Added"}
    else
      render json: {errors: @image.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update 
    @image = Image.find(params[:id])
    @image.url = params[:url] || @image.url
    if @image.save
      render "index.json.jbuilder"
    else
      render json: {errors: @images.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
