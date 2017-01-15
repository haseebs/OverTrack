require 'test_helper'

class HeroStatsControllerTest < ActionDispatch::IntegrationTest
  test "should not get index when logged out" do
    get hero_stats_url
    assert root_url
  end

end
