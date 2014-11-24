require 'openssl'
require 'base64'

module FieldDecrypter
  FieldDelimiter = '::'
  PrivateKeyFilepath = 'private.pem'
  SymmetricAlgorithm = 'AES-256-CBC'

  def decrypt(field)
    iv, encrypted_aes_key, encrypted_text = field.split(FieldDelimiter)
    private_key = OpenSSL::PKey::RSA.new(File.read(PrivateKeyFilepath))
    decrypted_aes_key = private_key.private_decrypt(Base64.decode64(encrypted_aes_key))
    self.decrypt_data(iv, decrypted_aes_key, encrypted_text)
  end

  private
    def self.decrypt_data(iv, key, encrypted_text)
      aes = OpenSSL::Cipher.new(SymmetricAlgorithm)
      aes.decrypt
      aes.key = key
      aes.iv = Base64.decode64(iv)
      aes.update(Base64.decode64(encrypted_text)) + aes.final
    end
end
