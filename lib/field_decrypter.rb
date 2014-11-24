require 'openssl'
require 'base64'

class FieldDecrypter
  attr_accessor :field_delimiter, :private_key_filepath, :symmetric_algorithm

  def initialize(private_key_filepath, options = {})
    @private_key_filepath   = private_key_filepath
    @field_delimiter        = options[:field_delimiter] || '::'
    @symmetric_algorithm    = options[:symmetric_algorithm] || 'AES-256-CBC'
  end

  def decrypt(field)
    return if field.blank?
    iv, encrypted_aes_key, encrypted_text = field.split(field_delimiter)
    private_key = OpenSSL::PKey::RSA.new(File.read(private_key_filepath))
    decrypted_aes_key = private_key.private_decrypt(Base64.decode64(encrypted_aes_key))
    decrypt_data(iv, decrypted_aes_key, encrypted_text)
  end

  private
    def decrypt_data(iv, key, encrypted_text)
      aes = OpenSSL::Cipher.new(symmetric_algorithm)
      aes.decrypt
      aes.key = key
      aes.iv = Base64.decode64(iv)
      aes.update(Base64.decode64(encrypted_text)) + aes.final
    end
end
