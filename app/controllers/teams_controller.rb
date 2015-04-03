class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @all_teams = Team.all
    @member_teams = current_user.teams
    @admin_teams = Team.where(admin_id: current_user.id)
        
    respond_with(@teams)
  end

  def show
    @projects = @team.projects
    @members = @team.memberships.where(status:"active")
    @requests = @team.memberships.where(status: "pending")
    respond_with(@team)
  end

  def new
    @team = Team.new
    respond_with(@team)
  end

  def edit
  end

  def create
    @team = current_user.teams.new(team_params)
    o = current_user.ownerships.new(team:@team)
    o.save
    @team.save
    respond_to do |format|
      format.html {redirect_to tasks_path, notice: "Team created"}
    end
  end

  def update
    @team.update(team_params)
    respond_with(@team)
  end

  def destroy
    @team.destroy
    respond_with(@teams)
  end

  
  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:id, :name)

    end

  end