ActiveAdmin.register ProjectLead do
  permit_params :user_id, :phase_id, :project_id, :client_id, :name, :platform, :is_sale
end
