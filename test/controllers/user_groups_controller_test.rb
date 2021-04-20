require 'test_helper'

class UserGroupsControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get user_groups_show_url
    assert_response :success
  end

  test 'should get index' do
    get user_groups_index_url
    assert_response :success
  end
end
