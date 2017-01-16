class CreateRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recommendations do |t|
      t.integer :best_hero
      t.integer :worst_hero
      t.integer :best_time_period
      t.integer :worst_time_period
      t.integer :best_group
      t.integer :worst_group
      t.integer :most_played_map
      t.integer :least_played_map
      t.integer :best_map
      t.integer :worst_map
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
