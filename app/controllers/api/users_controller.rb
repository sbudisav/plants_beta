class Api::UsersController < ApplicationController

  def create
    user = User.new(
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user = User.find(params[:id])
    @user.username = @user.username
    @user.location = @user.location
    render 'show.json.jbuilder'
  end

  def update
    @user = User.find(params[:id])
    @user.location = params[:location] || @user.location
    if @user.save
      render "show.json.jbuilder"
    else 
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
