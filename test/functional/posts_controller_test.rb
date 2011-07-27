require File.expand_path(File.join(File.dirname(__FILE__), '../test_helper'))

class PostsControllerTest < ActionController::TestCase
  setup do
    @request = ActionController::TestRequest.new  
    @post = posts(:whatever)
  #  @controller = AdminController.new  
    
  # @response = ActionController::TestResponse.new  
    set_basic_authentication  
  end
    
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end
  
   def set_basic_authentication  
     puts "..........................."
     @request.env['HTTP_AUTHORIZATION'] = 'Basic '+ Base64::encode64("vivienne:vivienne")
     #@request.env['HTTP_AUTHORIZATION'] = ‘Basic ‘ + Base64::b64encode(”taito:123456”)
     # 这里换成你自己的用户名和密码 
     puts "ppp.........#{@request.env['HTTP_AUTHORIZATION'].inspect}"  
   end
    

   test "should get new" do
 
    get :new
    #permission_denied render :file => "public/401.html", :status => :unauthorized
    assert_response :success
  end
test "should create post" do
    assert_difference('Post.count') do
      post :create, :post => @post.attributes
    end

    assert_redirected_to post_path(assigns(:post))
  end
  
  test "should show post" do
    get :show, :id => @post.to_param
    assert_response :success
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

    assert_redirected_to posts_path
  end
end
