class AddcoltoPhase < ActiveRecord::Migration[6.1]
  def change
    add_reference :phases, :user, index: true
  end
end
