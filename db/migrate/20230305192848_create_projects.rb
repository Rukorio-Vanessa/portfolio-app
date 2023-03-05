class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    t.integer :user_id, null: false
    t.string :title, null: false
    t.string :description
    t.string :current_state, null: false
    t.timestamps
  end
end
