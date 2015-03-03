class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new
  end

  def show
    begin
      @post = Post.find(params[:id])
    rescue
      render :action => :notfound
      return
    end
  end

  def edit
    
  end
  
  def register
    ps = params.require(:post).permit(:title, :content, :tag_list)
    @post = Post.new(ps)
    @post.userid = current_user.id
    if @post.save
      render @post
    else
      gon.tags = @post.tag_list
      render :action => 'new', id: @post.id
    end
    return
  end
  
end
