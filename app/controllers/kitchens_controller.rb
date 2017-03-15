class KitchensController < ApplicationController
	def index
  	end

  	def show
  		@kitchen = @Kitchen.find(params[:id])
  	end

	def create
    	@kitchen = Kitchen.new(params[:id])
    	redirect_to :back
	end
end

	def destroy
		@kitchen = Kitchen.find(params[:id])
		@kitchen.destroy

		redirect_to root_path
	end


