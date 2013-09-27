class WelcomeController < ApplicationController
  def index
    @home_page = true
    @posts = Post.order('id desc').limit(3)
  end

  def team
    @about_page = true
  end

  def contact
  end

  def calculator
  end
end
