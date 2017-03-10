require "stilltasty"
class PagesController < ApplicationController

  def home
  end

  def test_api
  	@food = Food.new
  end

  def find
  	@food = Food.create(params[:food])
  	# p @food
  	render "pages/search_results.js.erb"
  end

  def api_find
    result = StillTasty.name_search(params["food"])

    render json: { results: result }
  end

  def guide_find

    result = StillTasty.guide_search(params["food"])

    render json: { results: result }
  end

end
