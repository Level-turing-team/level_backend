class ProfileSerializer
  include FastJsonapi::ObjectSerializer
  attributes :zipcode, :user_id, :profile_picture
end
