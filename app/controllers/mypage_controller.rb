class MypageController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @my_posts = Post.where(user: current_user).page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def myposts
    
  end
  
end
