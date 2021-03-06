# == Schema Information
#
# Table name: consent_forms
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  send_email_copy :boolean
#  date            :datetime
#  project_id      :integer
#  device_label    :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class ConsentForm < ActiveRecord::Base
  extend Serket::DecryptedFields
  
  decrypted_fields :name, :email

  validates :name, presence: true
  validates :consent_text_id, presence: true
  validates :project_id, presence: true

  belongs_to :consent_text
end
