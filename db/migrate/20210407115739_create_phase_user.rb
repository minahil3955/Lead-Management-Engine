class CreatePhaseUser < ActiveRecord::Migration[6.1]
  def change
    create_table :phases_users do |t|
      t.belongs_to :phase
      t.belongs_to :user
    end
  end
end
