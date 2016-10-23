class AddReferenceToTask < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :user, references: :users, index: true
    add_foreign_key :tasks, :users, column: :user_id
  end
end
