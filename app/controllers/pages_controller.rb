class PagesController < ApplicationController
  def home
  	if current_user 
      @task = Task.new
  		redirect_to tasks_path  		
  	end
  end
  def about
  end
  def admin
    #get teams
    @all_teams = Team.all
    @owned_teams = view_context.owned_team_list_for(current_user)
    @member_of_teams = view_context.member_of_team_list_for(current_user)
    @all_projects = Project.all
    @owned_projects = view_context.owner_of_project_list_for(current_user)
    @member_of_projects = view_context.member_of_project_list_for(current_user)
  end
  def test
  	@task = Task.new
  end
end
