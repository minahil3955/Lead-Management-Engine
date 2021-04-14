ActiveAdmin.register Phase do
  permit_params :due_date, :status, :name
  form do |f|
    f.semantic_errors
    f.inputs :name
    f.inputs :due_date
    f.inputs :status
    f.actions
  end
end
