class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :zipcode, :user_name, :google_id
end
