# frozen_string_literal: true

class AddAuthenticationTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :authentication_token, :string
    add_index :users, :authentication_token
  end
end
