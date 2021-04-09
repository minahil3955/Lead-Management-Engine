class CreatePhases < ActiveRecord::Migration[6.1]
  def change
    create_table :phases do |t|
      t.string :phase_type
      t.date :start_date
      t.date :due_date
      t.date :creation_date
      t.integer :phase_status
      t.timestamps
    end
  end
end
