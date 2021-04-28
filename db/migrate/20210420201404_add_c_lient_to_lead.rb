# frozen_string_literal: true

class AddCLientToLead < ActiveRecord::Migration[6.1]
  def change
    add_reference :project_leads, :client, index: true
  end
end
