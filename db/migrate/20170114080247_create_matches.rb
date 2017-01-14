class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer:map
      t.integer :rank
      t.integer :wld
      t.text :notes
      t.string :video_link
      t.integer :winstreak
      t.integer :losestreak
      t.integer :rank_change
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
