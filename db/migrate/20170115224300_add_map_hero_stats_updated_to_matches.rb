class AddMapHeroStatsUpdatedToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :map_hero_stats_updated, :boolean, default: false
  end
end
