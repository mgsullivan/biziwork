class OwnershipsController < ApplicationController
	before_action :set_ownership, only: [ :destroy]

	def destroy
		@ownership.destroy
	end

	private

	def set_ownership
		@ownership = Ownership.find(params[:id])
	end
	def ownership_params
      params.require(:ownership).permit(:id, :team_id, :user_id)
    end

end