# frozen_string_literal: true

ActiveAdmin.register ProjectLead do
  permit_params :user_id, :client_id, :name, :platform, :sale_status

  form do |f|
    f.semantic_errors
    f.inputs :name
    f.inputs :platform
    f.inputs :user
    f.inputs :client
    f.inputs :sale_status
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
