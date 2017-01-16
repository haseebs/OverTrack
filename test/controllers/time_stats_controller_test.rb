require 'test_helper'

class TimeStatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get time_stats_index_url
    assert_response :success
  end

end
