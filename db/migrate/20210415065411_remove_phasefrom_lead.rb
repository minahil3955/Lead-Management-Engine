class RemovePhasefromLead < ActiveRecord::Migration[6.1]
  def change
    remove_column :project_leads, :phase_id
  end
end
