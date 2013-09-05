class QuotesController < ApplicationController
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
end
