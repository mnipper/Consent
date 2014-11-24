class CreateConsentForms < ActiveRecord::Migration
  def change
    create_table :consent_forms do |t|
      t.string :name
      t.string :email
      t.boolean :send_email_copy
      t.datetime :date
      t.integer :project_id
      t.string :device_label

      t.timestamps
    end
  end
end
