class CreateRoleUser < ActiveRecord::Migration[6.1]
  def change
    create_table :role_users do |t|
      t.references :role
      t.references :user
      t.timestamps
    end
  end
end
