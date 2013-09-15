class QuotesController < ApplicationController
	before_filter :admin_user,	only: [:index, :update, :destroy]

	def show
		@quote = Quote.find(params[:id])
	end

	def new
		@quote = Quote.new
	end

	def create
		@quote = Quote.new(params[:quote])
		if @quote.save
			flash[:success] = "Your quote request has been submitted!"
			redirect_to @quote
		else
			render 'new'
		end
	end

	def index
		@quotes = Quote.paginate(page: params[:page])
	end

	private

		def admin_user
			redirect_to(root) unless current_user.admin?
		end
end
