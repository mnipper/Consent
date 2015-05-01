# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.secret_key = if Rails.env.development? or Rails.env.test? 
    '93070d6af6e6a37e97c527ca653fe41fca3b8d7bcdd8eecd71f5b3cb9d6a95a00452b24e85967802a665c3cfb477f0ed4e1915a69a8a49dfdee881bdb32316fd'
  else
    ENV['DEVISE_SECRET_TOKEN']
  end 
  config.mailer_sender = 'noreply@chpir.org'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
