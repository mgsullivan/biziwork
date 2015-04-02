module TeamsHelper
	def owned_team_list_for(user)
		@list = Array.new
		user.ownerships.each do |ownership|
			@list.push(ownership.team)
		end
		return @list.uniq
	end
	def member_of_team_list_for(user)
		@list = Array.new
		user.teams.each do |team|
			@list.push(team)
		end
		return @list.uniq
	end
	def team_list_for(user)
		@list = owned_team_list_for(user) + member_of_team_list_for(user)
		return @list.uniq
	end
end