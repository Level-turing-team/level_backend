class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.bigint :user_id, index: true
      t.string :name
      

      t.timestamps
    end
  end
end
