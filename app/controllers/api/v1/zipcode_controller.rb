class Api::V1::ZipcodeController < ApplicationController

  def distance
    @profile_1 = Profile.find_by(user_id: params[:current_user])
    @profile_2 = Profile.find_by(user_id: params[:user])
    @zipcode = ZipcodeFacade.distance_between(@profile_1.zipcode, @profile_2.zipcode)

    render json: {data: @zipcode}
  end

end
