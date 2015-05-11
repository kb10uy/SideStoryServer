class MypageController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @my_posts = Post.where(user: current_user).page(params[:page]).per(10)
    @collection = Collection.new
  end
  
  def myposts
    @my_posts = Post.where(user: current_user).page(params[:page])
  end
  
end
