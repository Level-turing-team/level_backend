class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :url, :created_at, :updated_at, :gallery_id
  attribute :user_id do |photo|
    photo.gallery.user_id
  end
end
