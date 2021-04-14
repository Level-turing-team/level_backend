class ChangeColumnUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :circles, :user_id, :followee_id
  end
end
