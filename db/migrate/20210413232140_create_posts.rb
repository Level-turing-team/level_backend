class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.bigint :user_id, index: true
      t.text :content
      t.string :link
      

      t.timestamps
    end
  end
end
