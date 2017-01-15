class GroupStatsController < ApplicationController

  #Handle the deletion of matches
  #Subtract the corresponding values on deletion
  def index
    @group_stats = cur_user.group_stats
    @matches = cur_user.matches.where(group_stats_updated: false)
    return if @matches[0].nil?

    wldAndSize = @matches.select(:wld, :group_size)

    wldAndSize.each do |row|
      presentRow = @group_stats.where(group_size: row.group_size).take
      if presentRow.nil?
        @group_stat = @group_stats.build(wins: is_win(row.wld), losses: is_lose(row.wld),
                                         draws: is_draw(row.wld), total_games: 1,
                                         group_size: row.group_size)
        @group_stat.save
      else
        presentRow.update_attributes(wins: presentRow.wins + is_win(row.wld),
                                     losses: presentRow.losses + is_lose(row.wld),
                                     draws: presentRow.draws + is_draw(row.wld),
                                     total_games: presentRow.total_games + 1)
      end
    end
    @matches.update_all(group_stats_updated: true)
    @group_stats = cur_user.group_stats
  end
end
