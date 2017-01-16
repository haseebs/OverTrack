class PagesController < ApplicationController
  def home
      end

  def summary
      #add the recommentations here after check for login
    if logged_in?
      matches = cur_user.matches
      @total_games = matches.count
      @lowest_sr = matches.minimum(:rank)
      @highest_sr = matches.maximum(:rank)
      @wins = matches.where(wld: 1).count
      @losses = matches.where(wld: 2).count
      @draws = @total_games - @wins - @losses
      @longest_win_streak = matches.maximum(:winstreak)
      @longest_lose_streak = matches.maximum(:losestreak)
      #save it to db
      #avoid calculating this everytime by comparing the updatedat
      #of this with created at of last match
    else
      redirect_to login_path
    end
  end
end
