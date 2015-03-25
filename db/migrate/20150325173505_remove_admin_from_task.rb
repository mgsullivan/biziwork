class RemoveAdminFromTask < ActiveRecord::Migration
  def change
  	remove_column :tasks, :admin_id
  end
end
