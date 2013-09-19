class WelcomesController < ApplicationController

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

  # GET /welcomes
  # GET /welcomes.json
  def index
    @class_index = true

#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render :json => @welcomes }
#    end
  end

  def about
    @class_about = true
  end

  def contacts
    @class_contacts = true
  end

  def equipment
    @class_equipment = true
  end

  def services
    @class_services = true
  end

  def send_mail
    name = params[:send_mail][:name]
    email = params[:send_mail][:email]
    subject = params[:send_mail][:subject]
    message = params[:send_mail][:message]
    ContactMailer.send_mail(name, email, subject, message ).deliver
    redirect_to contacts_path, :notice  => "Message sent."
  end
end
