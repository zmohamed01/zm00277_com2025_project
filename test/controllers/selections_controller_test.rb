require 'test_helper'

class SelectionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @selection = selections(:selectionOne)
    get_users
    sign_in @userOne
  end

  test "should get index" do
    get selections_url
    assert_response :success
    assert_select 'h1', 'ALL SELECTIONS'
  end

  test "should get new" do
    get new_selection_url
    assert_response :success
    assert_select 'h1', 'NEW MODULE SELECTION'
  end

  test "should create selection" do
    Selection.delete(@selection)
    assert_difference('Selection.count', 1) do
      post selections_url, params: { selection: { title: @selection.title, reason: @selection.reason, user_id: @selection.user_id, course_id: @selection.course_id } }
    end

    assert_redirected_to selection_url(Selection.last)
  end

  test "should show selection" do
    get selection_url(@selection)
    assert_response :success
  end

  test "should get edit" do
    get edit_selection_url(@selection)
    assert_response :success
    assert_select 'h1', 'CHANGE A MODULE SELECTION'
  end

  test "should update selection" do
    patch selection_url(@selection), params: { selection: { title: @selection.title, reason: @selection.reason, user_id: @selection.user_id, course_id: @selection.course_id } }
    assert_redirected_to selection_url(@selection)
  end

  test "should destroy selection" do
    assert_difference('Selection.count', -1) do
      delete selection_url(@selection)
    end

    assert_redirected_to selections_url
  end
end
