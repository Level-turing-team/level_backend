class AddPhotoUrlToGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :photo_url, :string
  end
end
