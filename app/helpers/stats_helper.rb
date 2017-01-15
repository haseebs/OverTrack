module StatsHelper
  def is_win(wld)
    return 1 if wld == 1
    return 0
  end

  def is_lose(wld)
    return 1 if wld == 2
    return 0
  end

  def is_draw(wld)
    return 1 if wld == 3
    return 0
  end

  def win_ratio(wins, total_games)
    (wins/total_games.to_f) * 100
  end
end
