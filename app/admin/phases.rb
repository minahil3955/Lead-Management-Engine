ActiveAdmin.register Phase do
  permit_params :due_date, :status, :name, :project_lead_id, :user_id
  form do |f|
    f.semantic_errors
    f.inputs :name
    f.inputs :users
    f.inputs :due_date
    f.inputs :status
    f.inputs :project_lead
    f.actions
  end
end
