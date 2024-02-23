class AddStartAtAndEndAtToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :start_at, :date, null: false
    add_column :items, :end_at, :date
  end
end
