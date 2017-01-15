class CreateGroupStats < ActiveRecord::Migration[5.0]
  def change
    create_table :group_stats do |t|
      t.integer :wins
      t.integer :losses
      t.integer :draws
      t.integer :total_games
      t.string :group_size
      t.string :integer
      t.references :user, foreign_key: true
    end
  end
end
