module ProjectsHelper
	def project_name_list_for(team)
		@list = Array.new
		Project.where(team_id:team.id).each do |project|
			@list.push(project.name)
		end
		return @list
	end
	def member_of_project_list_for(user)
		@list = Array.new
		user.memberships.each do |membership|
			membership.team.projects.each do |project|
				@list.push(project)
			end
		end
		return @list.uniq
	end
	def owner_of_project_list_for(user)
		@list = Array.new
		user.ownerships.each do |ownership|
			ownership.team.projects.each do |project|
				@list.push(project)
			end
		end
		return @list.uniq
	end
	def project_list_for(user)
		@list = member_of_project_list_for(user) + owner_of_project_list_for(user)
		

		return @list.uniq
	end
	def project_actions_for(project,user)
		@actions = ""
		case team_relationship_for(project.team,user)
			when "owner"
				@actions += link_to("manage",project_path(project))
			when "member"
				@actions += link_to("quit","#")
			else
				@actions += ""
		end
		
		return @actions

	end
	

end
