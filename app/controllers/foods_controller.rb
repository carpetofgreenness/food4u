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

	def destroy
		@food = Food.find(params[:id])
		@food.destroy

		redirect_to :back
	end

	def to_kitchen
  		food = Food.find(params[:id])
  		sl = params["food"]["shelf_life"].to_i*60*60*24
  		food.update_attributes(purchased: true, purchased_at: Time.now, shelf_life: sl)
  		redirect_to "/kitchen"
  	end

  	def to_kitchen_new
  		p "WHAT PARAMS DO WE GET"
  		p params

  		food_arr = current_user.list

  		# loop through the current user's list and make updates
  		food_arr.each.with_index do |food,i|

  			# update shelf life in case it has been changed
  			sl = params["shelf_life"][i].to_i*60*60*24
  			food.update_attributes(shelf_life: sl)

  			# if it was checked, add to kitchen
  			if params["add"] && (params["add"].include? food.id.to_s)
	  			food.update_attributes(purchased: true, purchased_at: Time.now)
	  			p "added the food " + food.name + "to kitchen"
	  		end
  		end

  		redirect_to "/kitchen"
  	end

  	def to_list
  		food = Food.find(params[:id])
    	food.update_attributes(purchased: false, purchased_at: Time.now)

    	redirect_to "/kitchen"
  	end

  	# def update
  	# 	food = Food.find(params[:id])
  	# 	sl = params["food"]["shelf_life"].to_i*60*60*24
  	# 	food.update_attributes(purchased: true, purchased_at: Time.now, shelf_life: sl)
  	# 	redirect_to "/kitchen"
  	# end

	private

	def food_params
		params.require(:food).permit(:name, :still_tasty_id, :shelf_life, :purchased)
	end
end
