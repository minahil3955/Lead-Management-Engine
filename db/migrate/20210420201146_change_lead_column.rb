class ChangeLeadColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :project_leads, :is_sale, :sale_status
  end
end
