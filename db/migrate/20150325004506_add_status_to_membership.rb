class AddStatusToMembership < ActiveRecord::Migration
  def change
  	add_column :memberships, :status, :string, default: "pending"
  end
end
