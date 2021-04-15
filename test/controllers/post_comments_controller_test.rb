require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_comments_new_url
    assert_response :success
  end

  test "should get show" do
    get post_comments_show_url
    assert_response :success
  end

  test "should get create" do
    get post_comments_create_url
    assert_response :success
  end

  test "should get edit" do
    get post_comments_edit_url
    assert_response :success
  end

  test "should get delete" do
    get post_comments_delete_url
    assert_response :success
  end

end
