class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_assignee
      t.date :transition_date

      t.timestamps
    end
  end
end
