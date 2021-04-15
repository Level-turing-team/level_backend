class Api::V1::PostsController < ApplicationController
  def create
    @profile = Profile.find_by(user_id: params[:id])
    return invalid_params if @profile.nil?
    @post = Post.create(post_params)
    if @post.save
      render json: { data: 'post created successfully' }, status: 201
    else
      invalid_params
    end
  end

  def circle_posts
    @profile = Profile.find_by(user_id: params[:id])
    return invalid_params if @profile.nil?

    @posts = Profile.circle_posts(params[:id])
    @serial = PostSerializer.new(@posts)

    render json: @serial
  end

  def index
    @profile = Profile.find_by(user_id: params[:id])
    return invalid_params if @profile.nil?

    @posts = Post.where(user_id: params[:id])
    @serial = PostSerializer.new(@posts)

    render json: @serial
  end

  private

  def post_params
    params.permit(:content, :link, :user_id)
  end
end
