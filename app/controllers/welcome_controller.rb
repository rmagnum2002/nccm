class WelcomeController < ApplicationController
  def index
    @home_page = true
    @posts = Post.order('id desc').limit(3)
  end

  def team
    @about_page = true
  end

  def contacts
    @about_page = true
  end

  def calculator
    @drill_page = true
  end

  def plastic_calc
  end

  def metalic_calc
  end
end
