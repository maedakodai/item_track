class AddNameAndLineUserIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :line_user_id, :string
  end
end
