class RenameTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :former_leads, :project_leads
  end
end
