$field_decrypter = if Rails.env.development? or Rails.env.test?
  FieldDecrypter.new("#{Rails.root}/spec/resources/test_private_key.pem")
end
