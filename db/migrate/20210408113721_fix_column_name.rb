# frozen_string_literal: true

class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :clients, :client_name, :name
    rename_column :clients, :client_address, :address
    rename_column :clients, :client_email, :email
    rename_column :clients, :client_contact, :contact
    rename_column :comments, :comment_line, :body
    rename_column :project_leads, :lead_name, :name
    rename_column :phases, :phase_type, :type
    rename_column :phases, :phase_status, :status
    rename_column :projects, :project_name, :name
  end
end
