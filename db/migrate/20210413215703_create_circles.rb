class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles do |t|
      t.bigint :user_id, index: true
      t.bigint :following_id

      t.timestamps
    end
  end
end
