class Api::V1::GalleriesController < ApplicationController
  def index
    @profile = Profile.find_by(user_id: params[:id])
    return invalid_params if @profile.nil?

    @galleries = Gallery.where(user_id: params[:id])
    @serial = GallerySerializer.new(@galleries)

    render json: @serial
  end
end
