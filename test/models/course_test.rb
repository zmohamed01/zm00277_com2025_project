require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  def setup
    @course = courses(:courseOne)
    @course2 = courses(:courseTwo)

  end

  test "course should be valid" do
    assert @course.valid?
  end

  test "course should not be valid" do
    assert_not @course2.valid?
  end

  test "code should be present" do
    @course.code = " "
    assert_not @course.valid?
  end

  test "code should be unique" do
    @course.save
    @c2 = Course.new(code: "COM1035")
    assert_not @c2.valid?
  end

  test "code should not be too long" do
    @course.code = "C" * 11
    assert_not @course.valid?
  end

  test "title should be present" do
  @course.title = " "
  assert_not @course.valid?
end

test "description should be present" do
  @course.title = " "
  assert_not @course.valid?
end

test "description should not be too long" do
  @course.code = "C" * 10000
  assert_not @course.valid?
end



end