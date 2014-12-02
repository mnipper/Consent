Serket.configure do |config|
  config.private_key_path = "#{Rails.root}/spec/resources/test_private_key.pem"
  config.public_key_path = "#{Rails.root}/spec/resources/test_public_key.pem"
end
