module MembershipsHelper
	def pending_membership_requests_for(team)
	end
	def member_actions_for(membership, user)
		@actions = ""
		case team_relationship_for(membership.team,user)
			when "owner"
				@actions += link_to("approve","#") + " | " + link_to("deny","#")
			when "member"
				@actions += link_to("quit","#")
			when "pending"
				@actions += link_to("cancel request", "#")
			when "none"
				@actions += link_to("join","#")
			else
		end
		
		return @actions
	end

	

end
