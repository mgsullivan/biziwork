class Project < ActiveRecord::Base
	belongs_to :team
	has_many :tasks
end
