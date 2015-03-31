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
			@list.push(team)
		end
		user.ownerships.each do |ownership|
			@list.push(ownership.team)
		end

		return @list.uniq
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
	def get_alert_from_flash_type flash_type
		case flash_type
		when "notice"
			"alert alert-info"
		when "alert"
			"alert alert-warning"
		when "error"
			"alert alert-danger"
		else
			"alert alert-info"
		end
	end

end
