require 'test_helper'

class DistractorsControllerTest < ActionController::TestCase
  setup do
    @distractor = distractors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:distractors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create distractor" do
    assert_difference('Distractor.count') do
      post :create, distractor: {  }
    end

    assert_redirected_to distractor_path(assigns(:distractor))
  end

  test "should show distractor" do
    get :show, id: @distractor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @distractor
    assert_response :success
  end

  test "should update distractor" do
    patch :update, id: @distractor, distractor: {  }
    assert_redirected_to distractor_path(assigns(:distractor))
  end

  test "should destroy distractor" do
    assert_difference('Distractor.count', -1) do
      delete :destroy, id: @distractor
    end

    assert_redirected_to distractors_path
  end
end
