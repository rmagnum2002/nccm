class WelcomeController < ApplicationController
  def set_locale
    request_language = request.env['HTTP_ACCEPT_LANGUAGE']
    request_language = request_language.nil? ? nil : request_language[/[^,;]+/]

    if LOCALES.keys.include?(l = params[:lang]) && cookies[:lang] != l
      cookies[:lang] = {:value => l, :expires => 1.year.from_now}
    end

    if params[:back] !~ /^\//
      redirect_to root_path
    else
      redirect_to((params[:back]).gsub(/[\r\n]/, ''))
    end
  end

  def index
    @home_page = true
    @posts = Post.order('id desc').limit(3)
  end

  def contacts
    @contact_page = true
  end

  def calculator
    @drill_page = true
  end

  def plastic_calc
  end

  def metalic_calc
  end

  def technology
    @page = OpticFiber.where(page_key: "technology_page").first
  end

  def optic_fibers
    @page = OpticFiber.where(page_key: 'optic_fiber_page').first
  end

  def docs
    @docs_page = true
    @docs = Document.all
  end

  def gallery
    @gallery = Gallery.first
  end
end
