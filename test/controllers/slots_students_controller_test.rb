require "test_helper"

class SlotsStudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get slots_students_create_url
    assert_response :success
  end

  test "should get destroy" do
    get slots_students_destroy_url
    assert_response :success
  end
end
