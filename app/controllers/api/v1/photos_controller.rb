class Api::V1::PhotosController < ApplicationController
  def index
    @profile = Profile.find_by(user_id: params[:id])
    @gallery = Gallery.find_by(id: params[:gallery_id])
    return invalid_params if @profile.nil? || @gallery.nil?
    return invalid_params if @gallery.user_id != @profile.user_id

    @photos = @gallery.photos
    @serial = PhotoSerializer.new(@photos)

    render json: @serial
  end

  def create
    @profile = Profile.find_by(user_id: params[:id])
    @gallery = Gallery.find_by(id: params[:gallery_id])
    return invalid_params if @profile.nil? || @gallery.nil?
    @photo = @gallery.photos.create!(photo_params)
    if @photo.save
      @photo.feature.attach(
      io: File.open(params[:file].tempfile.path),
      filename: params[:file].original_filename,
      content_type: params[:file].content_type)
      if @photo.feature.attached?
      @photo.update(url: url_for(@photo.feature))
      end
      render json: { data: 'photo created successfully' }, status: 201
    else
      invalid_params
    end
  end

  def discover_index
    @photos = Photo.limit(50).order(created_at: :desc)
    @serial = PhotoSerializer.new(@photos)

    render json: @serial
  end

  private

  def photo_params
    params.permit(:description)
  end
end
