class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :url, :created_at, :updated_at, :gallery_id
end
