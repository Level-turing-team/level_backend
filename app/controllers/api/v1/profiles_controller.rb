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

  def index
    @profile = Profile.find_by(user_id: params[:id])
    return invalid_params if @profile.nil?

    if params[:tag] && !params[:name] && !params[:radius]
      @profiles = Profile.profiles_by_tag(params[:tag], @profile.user_id)
      @serial = ProfileSerializer.new(@profiles)
      render json: @serial
    elsif !params[:tag] && params[:name] && !params[:radius]
      @profiles = Profile.search_by_name(params[:name])
      @serial = ProfileSerializer.new(@profiles)
      render json: @serial
    elsif !params[:tag] && !params[:name] && params[:radius]
      @zipcodes = ZipcodeFacade.get_zipcodes(@profile.zipcode, params[:radius])
      @profiles = Profile.where(zipcode: @zipcodes).where.not(user_id: @profile.user_id)
      @serial = ProfileSerializer.new(@profiles)
      render json: @serial
    else
      invalid_params
    end
  end

  private

  def profile_params
    params.permit(:user_id, :zipcode, :profile_picture)
  end
end
