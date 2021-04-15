class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :link, :user_google_id
end
