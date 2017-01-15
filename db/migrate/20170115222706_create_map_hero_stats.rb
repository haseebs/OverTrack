class CreateMapHeroStats < ActiveRecord::Migration[5.0]
  def change
    create_table :map_hero_stats do |t|
      t.integer :wins
      t.integer :losses
      t.integer :draws
      t.integer :total_games
      t.integer :map
      t.integer :hero
      t.references :user, foreign_key: true
    end
  end
end
