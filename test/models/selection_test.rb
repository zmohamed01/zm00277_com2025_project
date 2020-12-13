require 'test_helper'

class SelectionTest < ActiveSupport::TestCase

  def setup
    @selection = selections(:selectionOne)
  end

  test "selection should be valid" do
    @selection.save
    assert @selection.valid?
  end

  test "title should be present" do
    @selection.title = ""
    assert_not @selection.valid?
  end

  test "reason should be present" do
    @selection.reason = ""
    assert_not @selection.valid?
  end

  test "reason should not be too long" do
    @selection.reason = "C" * 500
    assert_not @selection.valid?
  end

  test "reason should be long enough" do
    @selection.reason = "C"
    assert_not @selection.valid?
  end


end