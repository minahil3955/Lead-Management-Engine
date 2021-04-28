# frozen_string_literal: true

class AddForeignkeys < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :phases, :users
  end
end
