class TeamsController < ApplicationController
  #before_action :set_task, only: [:show, :edit, :update, :destroy, :change]
  before_action :authenticate_user!

  def index
    @all_teams = Team.all
    @my_teams = current_user.teams
        
    respond_with(@teams)
  end

  def show
    respond_with(@team)
  end

  def new
    @team = Team.new
    respond_with(@team)
  end

  def edit
  end

  def create
    @team = current_user.Teams.new(team_params)
    @team.admin = current_user.id
    @team.save
    respond_with(@team)
  end

  def update
    @team.update(team_params)
    respond_with(@team)
  end

  def destroy
    @team.destroy
    respond_with(@team)
  end

  def change
    @team.update_attributes(state: params[:state])
    respond_to do |format|
      format.html {redirect_to teams_path, notice: "Team updated"}
    end
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:id)

    end