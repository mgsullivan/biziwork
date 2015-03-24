class AddCommentsToTask < ActiveRecord::Migration
  def change
  	add_column :tasks, :comments, :text
  end
end
