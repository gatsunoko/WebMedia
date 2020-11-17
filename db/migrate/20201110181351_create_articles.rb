class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :eyecatch
      t.text :content
      t.references :genre
      t.references :user
      t.boolean :release, null: false, default: false
      t.integer :pv_count, null: false, default: 0

      t.timestamps
    end
    add_index :articles, :pv_count
    add_index :articles, :release
  end
end
