class HeroStatsController < ApplicationController
  before_action :user_logged_in

  #Handle the deletion of matches
  #Subtract the corresponding values on deletion
  def index
    @hero_names = ['Ana', 'Bastion','D.Va','Genji','Hanzo','Junkrat','Lucio','Mcree','Mei','Mercy','Pharah','Reaper', 'Reinhardt','Roadhog','Soldier: 76','Sombra','Symmetra','Torbjorn','Tracer','Widowmaker','Winston','Zarya','Zenyatta']
    @colors = ["#104673", "#E1D5A2", "#352424", "#F9F9EB", "#9B5F43", "#635847", "#A98805", "#8a7552", "#5d3b2c", "#fff16f", "#14437c", "#191a19", "#4a4f52", "#7a797a", "#616f9c", "#b82bff", "#5f3b2b", "#90b2b4", "#b4b491", "#757fa3", "#1a1c21", "#790f2f", "#e6e5d8"]
    @hero_stats = cur_user.hero_stats
    @total_games = cur_user.matches.count
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
    @hero_stats = cur_user.hero_stats

    #@data = []
    #@data[0] = 1

    #stat = @hero_stats.order(hero: :asc).pluck(:hero, :total_games)
    #stat.each_with_index do |s, i|
    #  if s == i
    #    @data[i] = s[1]
    #  else
    #   @data[i] = 0
    #  end
  end
end
