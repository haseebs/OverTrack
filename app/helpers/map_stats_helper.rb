module MapStatsHelper
   def get_chart_data_map(map_stats)
    chart_data = Array.new(14, 0)
    stats = map_stats.pluck(:map, :total_games)
    stats.each do |stat|
      chart_data[stat[0] - 1] = stat[1]
    end
    return chart_data
  end
end
