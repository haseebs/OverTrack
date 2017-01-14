class CreateHeros < ActiveRecord::Migration[5.0]
  def change
    create_table :heros do |t|
      t.integer :hero
      t.references :user, foreign_key: true
    end
  end
end
