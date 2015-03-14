class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :register, :delete]
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
    begin
      @post = Post.find(params[:id])
      @post_user = User.find(@post.userid)
      if (current_user.id != @post.userid) 
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
    @post.userid = current_user.id
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
      if (current_user.id != @post.userid) 
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
      if (current_user.id != @post.userid) 
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
  
end
