ActiveAdmin.register ProjectLead do
  permit_params :user_id, :client_id, :name, :platform, :is_sale

  form do |f|
    f.semantic_errors
    f.inputs :name
    f.inputs :platform
    f.inputs :user
    f.inputs :client
    f.inputs :is_sale
    f.actions
  end

  show do
    panel 'Lead Details' do
      table_for project_lead do
        column :name
        column :email
        column :platform
        column :user
        column 'Creation', :created_at
        column 'Updation', :updated_at
      end
    end
    active_admin_comments
  end
end
