class CreateConfigrations < ActiveRecord::Migration[6.0]
  def change
    create_table :configrations do |t|
      t.text :eyecatch

      t.timestamps
    end
  end
end
