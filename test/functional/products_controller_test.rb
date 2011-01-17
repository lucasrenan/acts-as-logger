require File.expand_path("../../test_helper", __FILE__)

class ProductsControllerTest < ActionController::TestCase
  setup do
    ActsAsLogger::User.current = Factory.create(:user)
    @product = Factory.create(:product)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get show" do
    get :show, :id => @product.to_param
    assert_response :success
    assert_not_nil assigns(:product)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    p = Factory.build(:product)
    
    assert_difference('Product.count') do
      post :create, :product => p.attributes
    end
  
    assert_redirected_to product_path(assigns(:product))
  end

  test "should get edit" do
    get :edit, :id => @product.to_param
    assert_response :success
  end

  test "should update product" do
    put :update, :id => @product.to_param, :product => @product.attributes
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, :id => @product.to_param
    end
  end
  
end