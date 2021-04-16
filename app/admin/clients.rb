ActiveAdmin.register Client do
  permit_params :name, :address, :email, :contact, project_leads_attributes: [:name]

  index do
    selectable_column
    column 'Name', :name
    column 'Email', :email
    column 'Contact', :contact
    column 'Address', :address
    actions defaults: true
  end
end
