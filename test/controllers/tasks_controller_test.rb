require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

  test "Make sure a user can only see their tasks." do
    session[:user_id] = users(:ada).id
    get :show, id: tasks(:adas_task).id

    assert_response :success
  end

  test "Make sure a user can only not see others' tasks." do
    session[:user_id] = users(:babbage).id
    get :show, id: tasks(:adas_task).id

    assert_response :redirect
    assert_equal flash[:notice], "You do not have access to that task."

  end

  test "should get index" do
    get tasks_index_url
    assert_response :success
  end

  test "should get create" do
    get tasks_create_url
    assert_response :success
  end

  test "should get show" do
    get tasks_show_url
    assert_response :success
  end

  test "should get new" do
    get tasks_new_url
    assert_response :success
  end

  test "should get edit" do
    get tasks_edit_url
    assert_response :success
  end

  test "should get update" do
    get tasks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get tasks_destroy_url
    assert_response :success
  end

end
