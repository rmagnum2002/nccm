class UtilitiesController < ApplicationController
  def index
    @about_page = true
    @utilities = Utility.all
  end

  def show
    @utility = Utility.find(params[:id])
  end
end
