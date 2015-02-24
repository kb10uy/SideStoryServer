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
    params.require(:post).permit(:title, :content)
    redirect_to :action => "show"
    return
  end
  
end
