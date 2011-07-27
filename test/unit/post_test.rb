require File.join(File.expand_path(File.dirname(__FILE__)), '../test_helper')

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the post should be created and saved" do
    params = {:name=> "a good name",:title=>"my title" }
   # params2 ={:titile=>"a blog blog "}
    #post = Post.new(params,params2)
    post = Post.new(params)
    puts ">>>>>>>>>>>>>post = #{post.inspect}"
    assert post.save
    assert_equal post.name,params[:name]
    assert_equal post.title,params[:title]
  end
  test "name and title should not be null" do
    params ={:name=>"",:title=>""}
    post = Post.new(params)
    assert !post.save
  end
  test "name should not be null" do
    params ={:name=>"",:title=>"the title"}
    post = Post.new(params)
    assert !post.save
  end
  test "name should not be null and title is not long enough" do
    params ={:name=>"",:title=>"sss"}
    post = Post.new(params)
    assert !post.save
  end
  test "title should not be null" do
    params ={:name=>"sss",:title=>""}
    post = Post.new(params)
    assert !post.save
  end
  test "the titled is too short" do
    params ={:name=>"sss",:title=>"ss"}
    post = Post.new(params)
    assert !post.save
  end
end
