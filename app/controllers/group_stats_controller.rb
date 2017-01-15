class GroupStatsController < ApplicationController
  def index
    @group_stats = cur_user.group_stats
    @matches = cur_user.matches

  end
end
