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
	def team_relationship_for(team,user)
		if team.ownership and team.ownership.user==user
			return "owner"
		elsif team.memberships.size>0 and team.memberships.where(user:user).size==1
			if team.memberships.where(user:user).first.status=="active"
				return "member"
			elsif team.memberships.where(user:user).first.status=="denied"
				return "denied"
			else
				return "pending"
			end
		else
			return "none"
		end
	end
	def team_actions_for(team,user)
		@actions = ""
		case team_relationship_for(team,user)
			when "owner"
				@actions += link_to("manage",edit_team_path(team))
			when "member"
				@actions += link_to("quit",membership_path(team.memberships.where(user: user).first), method: :delete)
			when "pending"
				@actions += link_to("cancel request", membership_path(team.memberships.where(user: user).first), method: :delete)
			when "none"
				@actions += link_to("join", memberships_path(user:user,team:team),method: :post)
			else
				@actions += ""
		end
		
		return @actions

	end
end