# frozen_string_literal: true

ActiveAdmin.register Phase do
  permit_params :name, :due_date, :status, :project_lead_id, :user_id
end
