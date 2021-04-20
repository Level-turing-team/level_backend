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
    @gallery = Gallery.find_or_create_by(gallery_params)
    if @gallery.save
      @photo = Photo.gallery_upload(@gallery.id, params[:photo_description], params[:file])
      if @photo.feature.attached?
      @photo.update(url: url_for(@photo.feature))
      end
      render json: { data: 'gallery created successfully' }, status: 201
    else
      invalid_params
    end
  end

  def destroy
    @gallery = Gallery.find(params[:gallery_id])
    @gallery.destroy
  end

  private

  def gallery_params
    params.permit(:user_id, :name)
  end
end
