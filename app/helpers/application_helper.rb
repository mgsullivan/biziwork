module ApplicationHelper
	def user_email_list
		@list = Array.new
		User.select("email").distinct.each do |user|
			@list.push(user.email)
		end
		return @list
	end
	def project_name_list_for(team)
		@list = Array.new
		Project.where(team_id:team.id).each do |project|
			@list.push(project.name)
		end
		return @list
	end
	def team_list_for(user)
		@list = Array.new
		user.teams.each do |team|
			@list.push(team.name)
		end
		return @list
	end
	def project_list_for(user)
		@list = Array.new
		user.ownerships.each do |ownership|
			ownership.team.projects.each do |project|
				@list.push(project)
			end
		end
		user.memberships.each do |membership|
			membership.team.projects.each do |project|
				@list.push(project)
			end
		end

		return @list.uniq
	end

end
