ActionMailer::Base.smtp_settings = {
  :address        => "smtp.qq.com", # default: localhost
  :port           => '25',                  # default: 25
  :user_name      => AppConfig.smtp_user,
  :password       => AppConfig.smtp_pass,
  :authentication => :plain                 # :plain, :login or :cram_md5
}
