class Project < ActiveRecord::Base
	belongs_to :team
	has_many :tasks
	has_many :users, through: :allocations
end
