class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :description
      t.string :current_state, null: false
      t.timestamps
    end
    add_foreign_key :projects, :users, column: :user_id
  end
end
