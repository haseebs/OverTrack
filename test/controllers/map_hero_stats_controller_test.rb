require 'test_helper'

class MapHeroStatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get map_hero_stats_index_url
    assert_response :success
  end

end
