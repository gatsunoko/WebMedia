class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :title
      t.string :text
      t.integer :order_number, null: false, default: 0

      t.timestamps
    end
    add_index :genres, :order_number
  end
end
