class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :profile_name
      t.string :zipcode
      t.integer :user_id
      t.timestamps
    end
  end
end
