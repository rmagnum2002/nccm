class WelcomeController < ApplicationController
  def index
    @home_page = true
  end

  def team
    @about_page = true
  end

  def contact
    @about_page = true
  end
end
