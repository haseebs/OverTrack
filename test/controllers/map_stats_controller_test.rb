require 'test_helper'

class MapStatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get map_stats_url
    assert root_url
  end

end
