class CreateGenreRecommendTags < ActiveRecord::Migration[6.0]
  def change
    create_table :genre_recommend_tags do |t|
      t.string :title
      t.references :genre

      t.timestamps
    end
    add_index :genre_recommend_tags, :title
  end
end
