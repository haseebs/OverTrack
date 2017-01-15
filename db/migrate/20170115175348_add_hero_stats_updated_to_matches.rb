class AddHeroStatsUpdatedToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :hero_stats_updated, :boolean, default: false
  end
end
