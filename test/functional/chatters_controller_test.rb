require 'test_helper'

class ChattersControllerTest < ActionController::TestCase
  setup do
    @chatter = chatters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chatters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chatter" do
    assert_difference('Chatter.count') do
      post :create, chatter: { message: @chatter.message, name: @chatter.name, user_id: @chatter.user_id }
    end

    assert_redirected_to chatter_path(assigns(:chatter))
  end

  test "should show chatter" do
    get :show, id: @chatter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chatter
    assert_response :success
  end

  test "should update chatter" do
    put :update, id: @chatter, chatter: { message: @chatter.message, name: @chatter.name, user_id: @chatter.user_id }
    assert_redirected_to chatter_path(assigns(:chatter))
  end

  test "should destroy chatter" do
    assert_difference('Chatter.count', -1) do
      delete :destroy, id: @chatter
    end

    assert_redirected_to chatters_path
  end
end
