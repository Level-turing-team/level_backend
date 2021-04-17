class GallerySerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :photo_url, :name, :created_at, :updated_at

  attribute :photo_count do |gallery|
    gallery.photos.size
  end
end
