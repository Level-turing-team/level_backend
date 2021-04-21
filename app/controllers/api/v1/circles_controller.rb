class Api::V1::CirclesController < ApplicationController
  def create
    @profile = Profile.find_by(user_id: params[:id])
    return invalid_params if @profile.nil?
    @circle = Circle.create(circle_params)
    if @circle.save
      render json: { data: 'circle created successfully' }, status: 201
    else
      invalid_params
    end
  end

  def destroy 
    circle = Circle.find_by(user_id: params[:user_id], following_id: params[:following_id])
    circle.destroy
    if !circle
      render json: { data: 'circle destroyed successfully' }, status: 201
    end  
    
  end

  private

  def circle_params
    params.permit(:user_id, :following_id)
  end
end
