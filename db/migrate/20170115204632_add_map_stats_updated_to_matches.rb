class AddMapStatsUpdatedToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :map_stats_updated, :boolean, default: false
  end
end
