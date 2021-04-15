class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :link, :user_id
end
