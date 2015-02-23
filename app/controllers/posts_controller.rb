class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new
  end

  def show
    
  end

  def edit
    
  end
  
  def register
    
  end
end
