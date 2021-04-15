class RemoveProjectfromLead < ActiveRecord::Migration[6.1]
  def change
    remove_column :project_leads, :project_id
  end
end
