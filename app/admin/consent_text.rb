ActiveAdmin.register ConsentText do
  permit_params :text, :project_id

  index do 
    column :id
    column :project_id
    column :text
    actions  
  end
  
  form do |f|
    f.inputs "Consent Details" do
      f.input :text
      f.input :project_id
    end
    f.actions
  end
end
