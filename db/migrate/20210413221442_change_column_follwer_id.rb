class ChangeColumnFollwerId < ActiveRecord::Migration[5.2]
  def change
    rename_column :circles, :follwer_id, :follower_id
  end
end
