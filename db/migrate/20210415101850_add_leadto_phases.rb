# frozen_string_literal: true

class AddLeadtoPhases < ActiveRecord::Migration[6.1]
  def change
    add_reference :phases, :project_lead, index: true
  end
end
