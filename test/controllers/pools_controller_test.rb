require "test_helper"

class PoolsControllerTest < ActionController::TestCase

  def pool
    @pool ||= pools :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pools)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Pool.count') do
      post :create, pool: { title: pool.title }
    end

    assert_redirected_to pool_path(assigns(:pool))
  end

  def test_show
    get :show, id: pool
    assert_response :success
  end

  def test_edit
    get :edit, id: pool
    assert_response :success
  end

  def test_update
    put :update, id: pool, pool: { title: pool.title }
    assert_redirected_to pool_path(assigns(:pool))
  end

  def test_destroy
    assert_difference('Pool.count', -1) do
      delete :destroy, id: pool
    end

    assert_redirected_to pools_path
  end
end
