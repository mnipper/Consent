ActiveAdmin.register ConsentForm do
  permit_params :name, :email, :date, :send_email_copy, :project_id, :device_label

end
