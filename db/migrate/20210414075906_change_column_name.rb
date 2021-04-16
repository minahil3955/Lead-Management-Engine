class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :phases, :type, :name
  end
end
