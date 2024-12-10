require "application_system_test_case"

class Admin::VideosTest < ApplicationSystemTestCase
  setup do
    @admin_video = admin_videos(:one)
  end

  test "visiting the index" do
    visit admin_videos_url
    assert_selector "h1", text: "Videos"
  end

  test "should create video" do
    visit admin_videos_url
    click_on "New video"

    click_on "Create Video"

    assert_text "Video was successfully created"
    click_on "Back"
  end

  test "should update Video" do
    visit admin_video_url(@admin_video)
    click_on "Edit this video", match: :first

    click_on "Update Video"

    assert_text "Video was successfully updated"
    click_on "Back"
  end

  test "should destroy Video" do
    visit admin_video_url(@admin_video)
    click_on "Destroy this video", match: :first

    assert_text "Video was successfully destroyed"
  end
end
