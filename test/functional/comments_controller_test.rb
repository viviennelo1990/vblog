require File.expand_path(File.join(File.dirname(__FILE__), '../test_helper'))

class CommentsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  setup do
    @post = posts(:whatever)
  end
  test "should create" do
    assert_difference('Comment.count') do
      post :create, :comment => {:commenter => 'vivi',:body => 'keng die aaaaaaa'},:post_id => @post.id
    end
    assert_redirected_to post_path(assigns(:post))
      end
   
end
