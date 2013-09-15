class LeadsController < ApplicationController
	before_filter :admin_user, only: [:index, :destroy]

	def show
		@lead = Lead.find(params[:id])
	end

	def new
		@lead = Lead.new
	end

	def create
		@lead = Lead.new(params[:lead])
		if @lead.save
			flash[:success] = "Your lead has been submitted"
			redirect_to rfq_path
		else
			redirect_to rfq_path
		end
	end

	def index
		@leads = Lead.paginate(page: params[:page])
	end

	def destroy
		Lead.find(params[:id]).destroy
		flash[:success] = "Lead destroyed."
		redirect_to leads_url
	end


	private

		def admin_user
			redirect_to(root) unless current_user.admin?
		end
end