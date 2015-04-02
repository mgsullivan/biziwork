class MembershipsController < ApplicationController
	before_action :set_membership, only: [ :destroy]
	def destroy
		@membership.destroy
	end
	def approve
		@membership.status = "approved"
		@membership.save
	end
	def promote
		@membership.team.ownership.user = @membership.user
		@membership.destroy
	end

private
	def set_membership
		@membership = Membership.find(params[:id])
	end
	def membership_params
      params.require(:membership).permit(:id, :team_id, :user_id)
    end

end