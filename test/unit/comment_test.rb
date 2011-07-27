require File.join(File.expand_path(File.dirname(__FILE__)), '../test_helper')

class CommentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "this comment should be create and save " do
    
    post = posts(:whatever)
   puts ">>>>>>>>>>>>>post = #{post.inspect}, post.comments= #{post.comments.inspect}"
    params= {:commenter=>"vivienne",:body =>"vivienne"}
     
    puts " !!!!!!!!!post.comments= #{post.comments.inspect}"
    assert_difference("post.comments.size") do
      @cmt = post.comments.create(params)
    end
    puts " post.comments= #{post.comments.inspect}"
    
    
    assert_equal @cmt.commenter,params[:commenter]
    assert_equal @cmt.body,params[:body]
    
  end
  test "commenter should not be null" do
    post =posts(:whatever)
    params={:commenter=>"",:body=>"vivienne"}
    cmt=post.comments.create(params)
    assert !cmt.save
  end
  test "body should not be null" do
    post =posts(:whatever)
    params ={:commenter=>"vivienne",:body=>""}
    cmt=post.comments.create(params)
    assert !cmt.save
  end
end
