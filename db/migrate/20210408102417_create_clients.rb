class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :client_name
      t.string :client_address
      t.string :client_email
      t.string :client_contact

      t.timestamps
    end
  end
end
