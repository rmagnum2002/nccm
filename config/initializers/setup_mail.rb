ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "gmail.com",
  :user_name => "nccmgrup@gmail.com",
  :password => "12032008",
  :authentication => "plain",
  :enable_starttls_auto => true
}

