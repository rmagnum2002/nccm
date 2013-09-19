class ContactMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def send_mail(name, email, subject, message)
    @name = name
    @email = email
    @subject = subject
    @message = message

    mail(:to => "nccmgrup@gmail.com", :subject => "#{subject}", :date => Time.now )
  end
end
