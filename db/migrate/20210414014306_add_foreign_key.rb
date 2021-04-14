class AddForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :posts, :users, column: :user_id
  end
end
