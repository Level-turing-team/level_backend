class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles do |t|
      t.integer :user_id
      t.integer :follwer_id

      t.timestamps
    end
  end
end
