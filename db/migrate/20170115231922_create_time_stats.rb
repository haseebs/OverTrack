class CreateTimeStats < ActiveRecord::Migration[5.0]
  def change
    create_table :time_stats do |t|
      t.integer :wins
      t.integer :losses
      t.integer :draws
      t.integer :total_games
      t.integer :time_period
      t.references :user, foreign_key: true
    end
  end
end
