class CreateProfileTags < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_tags do |t|
      t.bigint :user_id, index: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
