class CreateFormerLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :former_leads do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :contact
      t.string :platform
      t.date :joining_date
      t.boolean :is_sale

      t.timestamps
    end
  end
end
