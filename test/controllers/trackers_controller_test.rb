require "test_helper"

class TrackersControllerTest < ActionController::TestCase

  def tracker
    @tracker ||= trackers :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:trackers)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Tracker.count') do
      post :create, tracker: { kind: tracker.kind, pool_id: tracker.pool_id, title: tracker.title }
    end

    assert_redirected_to tracker_path(assigns(:tracker))
  end

  def test_show
    get :show, id: tracker
    assert_response :success
  end

  def test_edit
    get :edit, id: tracker
    assert_response :success
  end

  def test_update
    put :update, id: tracker, tracker: { kind: tracker.kind, pool_id: tracker.pool_id, title: tracker.title }
    assert_redirected_to tracker_path(assigns(:tracker))
  end

  def test_destroy
    assert_difference('Tracker.count', -1) do
      delete :destroy, id: tracker
    end

    assert_redirected_to trackers_path
  end
end
