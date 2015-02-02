class CreateConsentTexts < ActiveRecord::Migration
  def change
    create_table :consent_texts do |t|
      t.text :text
      t.integer :project_id, null: false, unique: true

      t.timestamps
    end
  end
end
