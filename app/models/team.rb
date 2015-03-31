class Team < ActiveRecord::Base
	has_many :memberships, dependent: :destroy
  	has_many :projects, dependent: :nullify
	has_one :ownership, dependent: :destroy
	
end
