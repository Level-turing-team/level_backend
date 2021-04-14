class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    # require "pry"; binding.pry
    # if @user.profile_picture.attached?
    #   @user.profile_picture.purge
    # end
    @user.profile_picture.attach(params[:profile_picture])
    # user.profile_picture.attach(io: File.open('app/assets/images/download.jpeg'),
    # filename: 'placeholder.jpeg', content_type: 'image/jpeg')
    # require "pry"; binding.pry
  end

  def index
    @user = User.last
  end

  private

  def user_params
    params.require(:user).permit(:profile_name, :zipcode, :user_id, :profile_picture)
  end
end
