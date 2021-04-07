class CreatePhaseUser < ActiveRecord::Migration[6.1]
  def change
    create_table :phase_users do |t|
      t.references :phase
      t.references :user
      t.timestamps
    end
  end
end
