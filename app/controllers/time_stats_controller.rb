class TimeStatsController < ApplicationController
  before_action :user_logged_in

  #Handle the deletion of matches
  #Subtract the corresponding values on deletion
  def index
    @time_stats = cur_user.time_stats
    @total_games = cur_user.matches.count
    matches = cur_user.matches.where(time_stats_updated: false)
    return if matches[0].nil?
    wldAndTime = matches.select(:wld, :created_at)

    wldAndTime.each do |row|
      time_period = get_time_id(row.created_at.time.hour)
      presentRow = @time_stats.where(time_period: time_period).take
      if presentRow.nil?
        time_stat = @time_stats.build(wins: is_win(row.wld), losses: is_lose(row.wld),
                                      draws: is_draw(row.wld), total_games: 1,
                                      time_period: time_period)
        time_stat.save
      else
        presentRow.update_attributes(wins: presentRow.wins + is_win(row.wld),
                                     losses: presentRow.losses + is_lose(row.wld),
                                     draws: presentRow.draws + is_draw(row.wld),
                                     total_games: presentRow.total_games + 1)
      end
    end

    #need to handle the case where user reloads the page while processing
    matches.update_all(time_stats_updated: true)
    @time_stats = cur_user.time_stats
  end
end
