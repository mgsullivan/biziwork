class MembershipsController < ApplicationController
	before_action :set_membership, only: [ :destroy, :create]
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
    	respond_with(@membership)
  	end
  	def create
  		session[:return_to] ||= request.referer
  		unless Membership.where(team: membership.team, user: membership.user).size >0
  			membership.save
  		end

  	end

private
	def set_membership
		@membership = Membership.find(params[:id])
	end
	def membership_params
      params.require(:membership).permit(:id, :team_id, :user_id)
    end

end