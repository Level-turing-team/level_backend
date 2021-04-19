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
      @gallery.feature.attach(
        io: File.open(params[:file].tempfile.path),
        filename: params[:file].original_filename,
        content_type: params[:file].content_type)
      render json: { data: 'gallery created successfully' }, status: 201
      if @gallery.feature.attached?
        @gallery.update(photo_url: url_for(@gallery.feature))
      end
    else
      invalid_params
    end
  end

  private

  def gallery_params
    params.permit(:user_id, :name)
  end
end
