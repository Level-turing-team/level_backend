class GallerySerializer
  include FastJsonapi::ObjectSerializer
  include Rails.application.routes.url_helpers
  attributes :user_id, :name, :created_at, :updated_at

  attribute :photo_url do |gallery|
    gallery.photo_url
  end
end
