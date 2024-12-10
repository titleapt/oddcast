require "test_helper"

class Admin::VideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_video = admin_videos(:one)
  end

  test "should get index" do
    get admin_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_video_url
    assert_response :success
  end

  test "should create admin_video" do
    assert_difference("Admin::Video.count") do
      post admin_videos_url, params: { admin_video: {} }
    end

    assert_redirected_to admin_video_url(Admin::Video.last)
  end

  test "should show admin_video" do
    get admin_video_url(@admin_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_video_url(@admin_video)
    assert_response :success
  end

  test "should update admin_video" do
    patch admin_video_url(@admin_video), params: { admin_video: {} }
    assert_redirected_to admin_video_url(@admin_video)
  end

  test "should destroy admin_video" do
    assert_difference("Admin::Video.count", -1) do
      delete admin_video_url(@admin_video)
    end

    assert_redirected_to admin_videos_url
  end
end
