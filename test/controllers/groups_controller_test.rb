require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get groups_create_url
    assert_response :success
  end

  test 'should get show' do
    get groups_show_url
    assert_response :success
  end

  test 'should get index' do
    get groups_index_url
    assert_response :success
  end

  test 'should get edit' do
    get groups_edit_url
    assert_response :success
  end

  test 'should get destroy' do
    get groups_destroy_url
    assert_response :success
  end
end
