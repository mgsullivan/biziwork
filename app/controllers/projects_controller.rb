class ProjectsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :change]
  before_action :authenticate_user!

  def index
    @all_projects = Project.all
        
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def create
    @project = @team.new(project_params)
    @project.save
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end



private
    def set_team
      @team = Team.find(params[:team_id])
    end

    def project_params
      params.require(:id).permit(:team_id, :name)

    end
end