module ConstantsHelper
  def get_map_name(map_id)
    case map_id
    when 1
      'Dorado'
    when 2
      'Eichenwalde'
    when 3
      'Hanamura'
    when 4
      'Hollywood'
    when 5
      'Ilios'
    when 6
      "King's Row"
    when 7
      'Lijang Tower'
    when 8
      'Nepal'
    when 9
      'Numbani'
    when 10
      'Oasis'
    when 11
      'Route 66'
    when 12
      'Temple of Anubis'
    when 13
      'Volskaya Industries'
    when 14
      'Watchpoint: Gibraltar'
    end
  end

  def get_hero_name(hero_id)
    case hero_id
    when 1
      'Ana'
    when 2
      'Bastion'
    when 3
      'D.Va'
    when 4
      'Genji'
    when 5
      'Hanzo'
    when 6
      'Junkrat'
    when 7
      'Lucio'
    when 8
      'Mcree'
    when 9
      'Mei'
    when 10
      'Mercy'
    when 11
      'Pharah'
    when 12
      'Reaper'
    when 13
      'Reinhardt'
    when 14
      'Roadhog'
    when 15
      'Soldier: 76'
    when 16
      'Sombra'
    when 17
      'Symmetra'
    when 18
      'Torbjorn'
    when 19
      'Tracer'
    when 20
      'Widowmaker'
    when 21
      'Winston'
    when 22
      'Zarya'
    when 23
      'Zenyatta'
    end
  end

  def get_wld(wld_val)
    case wld_val
    when 1
      'Win'
    when 2
      'Lose'
    when 3
      'Draw'
    end
  end

  def get_time_id(time)
    case
    when time >= 6 && time < 9
      return 1
    when time >= 9 && time < 12
      return 2
    when time >= 12 && time < 15
      return 3
    when time >= 15 && time < 18
      return 4
    when time >= 18 && time < 21
      return 5
    when time >= 21
      return 6
    when time >= 0 && time < 3
      return 7
    when time >= 3 && time < 6
      return 8
    end
  end

  def get_time_period(time)
    case time
    when 1
      '6 - 9'
    when 2
      '9 - 12'
    when 3
      '12 - 15'
    when 4
      '15 - 18'
    when 5
      '18 - 21'
    when 6
      '21 - 0'
    when 7
      '0 - 3'
    when 8
      '3 - 6'
    end
  end

end
