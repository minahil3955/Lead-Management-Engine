class AddDbValidations < ActiveRecord::Migration[6.1]
  def change
    change_column :clients, :name, :string, null: false
    change_column :clients, :address, :string, null: false
    change_column :clients, :email, :string, null: false
    change_column :clients, :contact, :string, null: false

    change_column :comments, :body, :text, null: false

    change_column :phases, :name, :string, null: false
    change_column :phases, :due_date, :date, null: false
    change_column :phases, :status, :integer, null: false

    change_column :project_leads, :name, :string, null: false
    change_column :project_leads, :platform, :string, null: false
    change_column :project_leads, :sale_status, :integer, null: false

    change_column :projects, :name, :string, null: false

    change_column :roles, :name, :integer, null: false

    change_column :users, :name, :string, null: false





  end
end
