class RemoveTimestampsFromHeroStats < ActiveRecord::Migration[5.0]
  def change
    remove_column :hero_stats, :created_at, :string
    remove_column :hero_stats, :updated_at, :string
  end
end
