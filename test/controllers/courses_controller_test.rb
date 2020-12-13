require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @course = courses(:courseOne)
  end

  test "should get search" do
    get search_courses_url(@course)
    assert_redirected_to courses_url
  end

end
