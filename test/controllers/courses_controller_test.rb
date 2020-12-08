require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get courses" do
    get courses_courses_url
    assert_response :success
  end

end
