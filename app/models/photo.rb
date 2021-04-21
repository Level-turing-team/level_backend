class Photo < ApplicationRecord
  belongs_to :gallery
  has_one_attached :feature
  validates :description, presence: true

  def self.gallery_upload(gallery_id, photo_description, file)
    @photo = Gallery.find(gallery_id).photos.create!(description: photo_description)
    @photo.feature.attach(
    io: File.open(file.tempfile.path),
    filename: file.original_filename,
    content_type: file.content_type)
    @photo
  end
end
