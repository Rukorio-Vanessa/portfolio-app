class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
    end
    add_foreign_key :skills, :users, column: :user_id

  end
end
