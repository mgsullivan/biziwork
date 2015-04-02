class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :change]
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
    @project = Project.new(project_params)
    @project.save
    respond_to do |format|
      format.html {redirect_to tasks_path, notice: "Project created"}
    end
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
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:team_id, :name)
    end
end