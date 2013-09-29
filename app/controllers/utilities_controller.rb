class UtilitiesController < ApplicationController
  def index
    @about_page = true
    @utilities = Utility.all
  end
end
