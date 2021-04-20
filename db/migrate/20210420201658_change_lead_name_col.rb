class ChangeLeadNameCol < ActiveRecord::Migration[6.1]
  def change
    rename_column :project_leads, :lead_name, :name
  end
end
