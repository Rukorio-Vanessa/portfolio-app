class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
    end
  end
end
