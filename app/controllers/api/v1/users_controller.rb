class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.save
      render json: { data: 'user created successfully' }, status: 201
    else
      invalid_params
    end
  end

  def circle
    @user = User.find_by(google_id: params[:id])
    if @user.nil?
      invalid_params
    else
      @circle = @user.followees
      @serial = UserSerializer.new(@circle)

      render json: @serial
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :user_name, :zipcode, :google_id, :profile_picture)
  end
end
