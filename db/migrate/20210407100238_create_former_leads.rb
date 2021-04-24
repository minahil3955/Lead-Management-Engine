class CreateFormerLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :project_leads do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :phase, foreign_key: true
      t.string :lead_name
      t.string :platform
      t.date :joining_date
      t.integer :is_sale

      t.timestamps
    end
  end
end
