Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.assets.version = '1.0'
  config.log_level = :info
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false
  
  config.before_configuration do 
   env_file = File.join(Rails.root, 'config', 'local_env.yml')
   YAML.load(File.open(env_file)).each do |key, value|
    ENV[key.to_s] = value
    end if File.exists?(env_file)
  end 
  
  config.middleware.use ExceptionNotification::Rack,
     :email => {
     :email_prefix => Settings.exception_notifications.email_prefix,
     :sender_address => Settings.exception_notifications.sender,
     :exception_recipients => Settings.exception_notifications.recipients
  }

   config.action_mailer.delivery_method = :smtp
   config.action_mailer.perform_deliveries = true
   config.action_mailer.raise_delivery_errors = true
   config.action_mailer.smtp_settings = {
      :authentication => :plain,
      :address => "smtp.mailgun.org",
      :port => 587,
      :domain => ENV['SMTP_DOMAIN'],
      :user_name => ENV['SMTP_USERNAME'],                                                                      
      :password => ENV['SMTP_PASSWORD']
   }
 
 config.action_mailer.default_url_options = { :host => ENV['HOSTNAME'] }
  
end
