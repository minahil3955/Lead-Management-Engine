# frozen_string_literal: true

class DeleteColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :project_leads, :joining_date
    remove_column :phases, :start_date
    remove_column :phases, :creation_date
    remove_column :projects, :transition_date
    remove_column :projects, :project_assignee
  end
end
