class Api::V1::PostsController < ApplicationController
  def create
    @user = User.find_by(google_id: params[:id])
    return invalid_params if @user.nil?
    @post = @user.posts.create(post_params)
    if @post.save
      render json: { data: 'post created successfully' }, status: 201
    else
      invalid_params
    end
  end

  def circle_posts
    @user = User.find_by(google_id: params[:id])
    return invalid_params if @user.nil?
    @posts = @user.posts
    @serial = PostSerializer.new(@posts)

    render json: @serial
  end

  private

  def post_params
    params.permit(:content, :link, :user_google_id)
  end
end
