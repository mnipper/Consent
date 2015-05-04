class AddConsentTextIdToConsentForm < ActiveRecord::Migration
  def change
    add_column :consent_forms, :consent_text_id, :integer
  end
end
