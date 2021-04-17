class Api::V1::GalleriesController < ApplicationController
  def index
    @profile = Profile.find_by(user_id: params[:id])
    return invalid_params if @profile.nil?

    @galleries = Gallery.where(user_id: params[:id])
    @serial = GallerySerializer.new(@galleries)

    render json: @serial
  end

  def create
    @profile = Profile.find_by(user_id: params[:id])
    return invalid_params if @profile.nil?

    @gallery = Gallery.create(gallery_params)
    if @gallery.save
      render json: { data: 'gallery created successfully' }, status: 201
    else
      invalid_params
    end
  end

  private

  def gallery_params
    params.permit(:user_id, :name, :created_at, :updated_at, :photo_url)
  end
end
