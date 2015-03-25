class AddAdminToTeam < ActiveRecord::Migration
  def change
  	add_column :tasks, :admin_id, :integer
  end
end
