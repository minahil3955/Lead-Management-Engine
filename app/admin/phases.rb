ActiveAdmin.register Phase do
  permit_params :type, :due_date, :status, :phase_status
  form do |f|
    f.semantic_errors
    f.inputs :name
    f.inputs :due_date
    f.inputs :status
    f.actions
  end
end
