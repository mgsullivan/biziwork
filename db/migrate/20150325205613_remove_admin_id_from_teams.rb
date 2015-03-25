class RemoveAdminIdFromTeams < ActiveRecord::Migration
  def change
  	remove_column :teams, :admin_id
  end
end
