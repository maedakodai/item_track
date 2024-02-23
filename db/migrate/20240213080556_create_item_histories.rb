class CreateItemHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :item_histories do |t|
      t.references :item, null: false, foreign_key: true
      t.date :start_at, null: false
      t.date :end_at

      t.timestamps
    end
  end
end
