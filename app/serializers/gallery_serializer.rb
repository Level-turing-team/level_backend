class GallerySerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :name, :created_at, :updated_at
end
