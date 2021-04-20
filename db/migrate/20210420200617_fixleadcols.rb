class Fixleadcols < ActiveRecord::Migration[6.1]
  def change
    rename_column :project_leads, :lead_name, :name
    remove_column :project_leads, :joining_date
  end
end
