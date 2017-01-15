class AddGroupStatsUpdatedToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :group_stats_updated, :boolean, default: false
  end
end
