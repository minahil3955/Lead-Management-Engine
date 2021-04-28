# frozen_string_literal: true

class AddClientsFktoLeads < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :project_leads, :clients
  end
end
