module ApplicationHelper
	include ProjectsHelper
	include TeamsHelper
	def user_email_list
		@list = Array.new
		User.select("email").distinct.each do |user|
			@list.push(user.email)
		end
		return @list
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
