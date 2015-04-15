class MembershipsController < ApplicationController
	before_action :set_membership, only: [ :destroy]
	before_action :set_team, only: [:create]
	before_action :set_user, only: [:create]
	respond_to :html
	def destroy
		@membership.destroy
		respond_to do |format|
      		format.html {redirect_to admin_path, notice: "Request cancelled"}
    	end
	end
	def approve
		@membership.status = "approved"
		@membership.save
	end
	def deny
		@membership.status = "deny"
	end
	def promote
		@membership.team.ownership.user = @membership.user
		@membership.destroy
	end
	def new
    	@membership = Membership.new
    	
  	end
  	def create
<<<<<<< HEAD
  		session[:return_to] ||= request.referer
  		unless Membership.where(team: membership.team, user: membership.user).size >0
  			membership.save
=======
  		@membership = Membership.new(user:@user,team:@team)
  		unless Membership.where(team: @team, user: @user).size >0

  			@membership.save
>>>>>>> 0e470ac967b6455507019380225358a1af8e380a
  		end
  		respond_to do |format|
      		format.html {redirect_to admin_path, notice: "Request submitted"}
    	end

  	end

private
	def set_team
		@team = Team.find(params[:team])
	end 
	def set_user
		@user = User.find(params[:user])
	end
	def set_membership
		@membership = Membership.find(params[:id])
	end
	def membership_params
      params.require().permit(:id, :team_id, :user_id)
    end

end