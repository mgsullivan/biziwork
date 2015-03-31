class AddOwnershipIdToTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :ownership_id, :integer
  	add_index :teams, :ownership_id
  end
end
