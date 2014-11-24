Consent::Application.config.secret_key_base = if Rails.env.development? or Rails.env.test?
  '7936e9671547a57d49c0e998bd38cf054a0b9542e030d0cc8c3cd8907bbc57ee01aefb113e6c63e1446c7d1ca541135b466208400a56e3d1515b21103bd58b64'
else
  File.read(File.join(Rails.root, 'config', 'secret_token.txt'))
end
