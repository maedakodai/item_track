class DropItemHistories < ActiveRecord::Migration[7.1]
  def change
    drop_table :item_histories
  end
end
