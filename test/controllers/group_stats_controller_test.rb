require 'test_helper'

class GroupStatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get group_stats_index_url
    assert_response :success
  end

end
