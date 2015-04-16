class HomeController < ApplicationController
  def welcome
    @posts_new = Post.limit(10).order(:updated_at).reverse_order
    @posts_pop = Post.limit(10).order(:pvcount).reverse_order
    @posts_hig = Post.limit(10).order(:nicecount).reverse_order
  end
end
