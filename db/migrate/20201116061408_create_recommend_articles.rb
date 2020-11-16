class CreateRecommendArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :recommend_articles do |t|
      t.references :article, null: false, foreign_key: true
      t.integer :order_number, null: false, default: 0

      t.timestamps
    end
  end
end
