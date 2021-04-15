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
end
