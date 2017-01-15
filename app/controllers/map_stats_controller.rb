class MapStatsController < ApplicationController
  before_action :user_logged_in

  #Handle the deletion of matches
  #Subtract the corresponding values on deletion
  def index
    @map_stats = cur_user.map_stats
    @total_games = cur_user.matches.count
    matches = cur_user.matches.where(map_stats_updated: false)
    return if matches[0].nil?

    wldAndMap = matches.select(:wld, :map)

    wldAndMap.each do |row|
      presentRow = @map_stats.where(map: row.map).take
      if presentRow.nil?
        map_stat = @map_stats.build(wins: is_win(row.wld), losses: is_lose(row.wld),
                                    draws: is_draw(row.wld), total_games: 1,
                                    map: row.map)
        map_stat.save
      else
        presentRow.update_attributes(wins: presentRow.wins + is_win(row.wld),
                                     losses: presentRow.losses + is_lose(row.wld),
                                     draws: presentRow.draws + is_draw(row.wld),
                                     total_games: presentRow.total_games + 1)
      end
    end

    #need to handle the case where user reloads the page while processing
    matches.update_all(map_stats_updated: true)
    @map_stats = cur_user.map_stats
  end
end
