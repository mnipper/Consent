module EncryptedFields
  def encrypted_fields(*fields)
    fields.each do |field|
      define_method("#{field}=") do |value|
        write_attribute(:field, $field_decrypter.decrypt(value))
      end
    end
  end
end
