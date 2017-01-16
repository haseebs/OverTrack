class AddTimeStatsUpdatedToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :time_stats_updated, :boolean, default: false
  end
end
