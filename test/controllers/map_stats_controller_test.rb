require 'test_helper'

class MapStatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get map_stats_index_url
    assert_response :success
  end

end
