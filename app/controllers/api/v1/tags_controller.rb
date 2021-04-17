class Api::V1::TagsController < ApplicationController

  def index
    @profile = Profile.find_by(user_id: params[:id])
    return invalid_params if @profile.nil?
    @p_tags = ProfileTag.where(user_id: params[:id]).pluck(:tag_id)
    @tags = Tag.find(@p_tags)
    @serial = TagSerializer.new(@tags)

    render json: @serial
  end

  def create
    @tag = Tag.create(tag_params)
    if @tag.save
      render json: {data: 'tags successfully created'}, status: :created
    else
      invalid_params
    end
  end

  def tags_user_create
    @profile = Profile.find_by(user_id: params[:id])
    return invalid_params if @profile.nil? || !params[:tag_id]
    @tag = Tag.find(params[:tag_id])
    @tag.profile_tags.create(user_id: @profile.user_id)
    render json: {data: 'tags successfully created'}, status: :created
  end



  private

  def tag_params
    params.permit(:name)
  end
end
