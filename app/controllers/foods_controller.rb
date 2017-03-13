class FoodsController < ApplicationController

	def create
		
	    food_params["shelf_life"] = food_params["shelf_life"].to_i
		@food = current_user.foods.create(food_params)
		if @food.save
			flash[:notice] = "Your food was created successfully"
			redirect_to "/list"
		else
			flash[:alert] = "There was a problem saving your food."
			redirect_to "/list"
		end
	end

	private

	def food_params
		params.require(:food).permit(:name, :still_tasty_id, :shelf_life, :purchased)
	end
end
