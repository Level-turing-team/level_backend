class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.profile_picture.attached?
      @user.profile_picture.purge
    end
    @user.profile_picture.attach(params[:profile_picture])
  end

  def index
    @user = User.last
  end

  private

  def user_params
    params.require(:user).permit(:profile_name, :zipcode, :user_id, :profile_picture)
  end
end
