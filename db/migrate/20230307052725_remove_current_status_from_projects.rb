class RemoveCurrentStatusFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :current_state

  end
end
