class PostsController < ApplicationController
  def index
    @about_page = true
    @posts = Post.order('id desc')
  end

  def show
    @post = Post.find(params[:id])
  end
end
