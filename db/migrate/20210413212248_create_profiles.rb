class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.bigint :user_id
      t.string :zipcode
      t.string :profile_picture

      t.timestamps
    end
  end
end

