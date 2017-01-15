class HeroStatsController < ApplicationController
  before_action :user_logged_in

  #Handle the deletion of matches
  #Subtract the corresponding values on deletion
  def index
    @hero_stats = cur_user.hero_stats
    @matches = cur_user.matches.where(hero_stats_updated: false)
    return if @matches[0].nil?

    wldAndID = @matches.select(:wld, :id)

    wldAndID.each do |row|
      #Hits db multiple times, can be reduced by storing it first
      heros = Hero.where(match_id: row.id).pluck(:hero)

      heros.each do |hero|
        presentRow = @hero_stats.where(hero: hero).take
        if presentRow.nil?
          hero_stat = @hero_stats.build(wins: is_win(row.wld), losses: is_lose(row.wld),
                                        draws: is_draw(row.wld), total_games: 1,
                                        hero: hero)
          hero_stat.save
        else
          presentRow.update_attributes(wins: presentRow.wins + is_win(row.wld),
                                       losses: presentRow.losses + is_lose(row.wld),
                                       draws: presentRow.draws + is_draw(row.wld),
                                       total_games: presentRow.total_games + 1)
        end
      end
    end
    @matches.update_all(hero_stats_updated: true)
    @group_stats = cur_user.hero_stats
  end
end
