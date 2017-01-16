module HeroStatsHelper
  def get_chart_data(hero_stats)
    chart_data = Array.new(23, 0)
    stats = hero_stats.pluck(:hero, :total_games)
    stats.each do |stat|
      chart_data[stat[0]] = stat[1]
    end
    return chart_data
  end
end
