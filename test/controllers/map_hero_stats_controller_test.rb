require 'test_helper'

class MapHeroStatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get map_hero_stats_url
    assert root_url
  end

end
