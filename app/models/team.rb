class Team < ActiveRecord::Base
	has_many :memberships
  	has_many :users, through: :memberships
	has_many :projects
	has_one :admin, through: :ownerships 
end
