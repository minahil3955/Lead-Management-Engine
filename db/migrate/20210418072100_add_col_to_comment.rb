class AddColToComment < ActiveRecord::Migration[6.1]
  def change
    change_table :comments do |t|
      t.references :commentable, polymorphic: true, index: true
    end
  end
end
