class PostsController < ApplicationController
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
    begin
      @post_user = User.find(@post.userid)
    rescue
      @post_user = User.new
      @post_user.username = "<ユーザー不明>"
    end
  end

  def edit
    
  end
  
  def register
    ps = params.require(:post).permit(:title, :content, :tag_list)
    @post = Post.new(ps)
    @post.userid = current_user.id
    if @post.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to :action => 'show', id: @post.id
    else
      gon.tags = @post.tag_list
      render :action => 'new', id: @post.id
    end
    return
  end
  
  def delete
    begin
      @post = Post.find(params[:id])
    rescue
      render :action => :notfound
      return
    end
    
  end
  
end
