class Api::V1::ProfilesController < ApplicationController
  def create
    @profile = Profile.create(profile_params)
    if @profile.save
      render json: { data: 'profile created successfully' }, status: 201
    else
      invalid_params
    end
  end

  def circle
    @profile = Profile.find_by(user_id: params[:id])
    if @profile.nil?
      invalid_params
    else
      @circle = Circle.where(user_id: params[:id])
      @profiles = @circle.map{|profile| Profile.find_by(user_id: profile.following_id)}
      @serial = ProfileSerializer.new(@profiles)

      render json: @serial
    end
  end

  private

  def profile_params
    params.permit(:user_id, :zipcode, :profile_picture)
  end
end
