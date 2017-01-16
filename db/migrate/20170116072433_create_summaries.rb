class CreateSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :summaries do |t|
      t.integer :total_games
      t.integer :lowest_sr
      t.integer :highest_sr
      t.integer :wins
      t.integer :losses
      t.integer :draws
      t.integer :longest_win_streak
      t.integer :longest_lose_streak

      t.timestamps
    end
  end
end
