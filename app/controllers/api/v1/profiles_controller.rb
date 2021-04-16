class Api::V1::ProfilesController < ApplicationController

  def near_me
    @profile = Profile.find_by(user_id: params[:id])
    return invalid_params if @profile.nil?
    @zipcodes = ZipcodeFacade.near_me(@profile.zipcode)
    @profiles = Profile.where(zipcode: @zipcodes)
    @serial = ProfileSerializer.new(@profiles)
    render json: @serial
  end

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
      @profiles = Profile.friends(params[:id])
      @serial = ProfileSerializer.new(@profiles)

      render json: @serial
    end
  end

  def show
    @profile = Profile.find_by(user_id: params[:id])
    return invalid_params if @profile.nil?
    @serial = ProfileSerializer.new(@profile)

    render json: @serial
  end

  private

  def profile_params
    params.permit(:user_id, :zipcode, :profile_picture)
  end
end
