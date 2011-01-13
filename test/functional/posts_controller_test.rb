require "test_helper"

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = Factory.create(:post)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get show" do
    get :show, :id => @post.to_param
    assert_response :success
    assert_not_nil assigns(:post)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    p = Factory.build(:post)
    
    assert_difference('Post.count') do
      post :create, :post => p.attributes
    end
  
    assert_redirected_to post_path(assigns(:post))
  end

  test "should get edit" do
    get :edit, :id => @post.to_param
    assert_response :success
  end

  test "should update post" do
    put :update, :id => @post.to_param, :post => @post.attributes
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, :id => @post.to_param
    end
  end
  
end