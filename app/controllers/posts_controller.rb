class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :register, :delete]
  def new
    @post = Post.new
  end

  def show
    begin
      @post = Post.find(params[:id])
      Post.record_timestamps = false
      @post.update(pvcount: @post.pvcount + 1)
      Post.record_timestamps = true
      gon.post = @post
      gon.nicepath = view_context.posts_nice_path(params[:id])
      gon.badpath = view_context.posts_bad_path(params[:id])
      logger.debug("####################" + gon.nicepath)
    rescue
      render :action => :notfound
      return
    end
    begin
      @post_user = @post.user
    rescue
      @post_user = User.new
      @post_user.username = "<ユーザー不明>"
    end
  end

  def edit
    begin
      @post = Post.find(params[:id])
      @post_user = User.find(@post.user_id)
      if (current_user != @post.user) 
        redner :action => :forbidden
      end
    rescue
      render :action => :notfound
      return
    end
  end
  
  def update
    ps = params.require(:post).permit(:title, :content, :tag_list, :id)
    @post = Post.find(params[:id])
    if @post.update(title: ps[:title], tag_list: ps[:tag_list], content: ps[:content])
      flash[:notice] = "更新が完了しました。"
      redirect_to :action => 'show', id: @post.id
    else
      gon.tags = @post.tag_list
      render :action => :edit, id: @post.id
    end
  end
  
  def register
    ps = params.require(:post).permit(:title, :content, :tag_list)
    @post = Post.new(ps)
    @post.pvcount = 0
    @post.nicecount = 0
    @post.user = current_user
    if @post.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to :action => 'show', id: @post.id
    else
      gon.tags = @post.tag_list
      render :action => :new, id: @post.id
    end
    return
  end
  
  def delete
    begin
      @post = Post.find(params[:id])
      if (current_user != @post.user) 
        redner :action => :forbidden
      end
    rescue
      render :action => :notfound
      return
    end
  end
  
  def destroy
    begin
      @post = Post.find(params[:id])
      if (current_user != @post.user) 
        redner :action => :forbidden
      end
      @post.destroy
      flash[:notice] = "削除が完了しました。"
      redirect_to '/'
    rescue
      render :action => :notfound
      return
    end
  end
  
  def nice
    Post.record_timestamps = false
    @post = Post.find(params[:id])
    if @post.update(nicecount: @post.nicecount + 1)
      head :ok
    else
      head :internal_server_error
    end
    Post.record_timestamps = true
  end
  
  def bad
    Post.record_timestamps = false
    @post = Post.find(params[:id])
    if @post.update(badcount: @post.badcount + 1)
      head :ok
    else
      head :internal_server_error
    end
    Post.record_timestamps = true
  end
  
end
