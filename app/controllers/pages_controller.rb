require "stilltasty"
class PagesController < ApplicationController

  def home
  end

  def test_api
  	@food = StillTasty.search("cucumber")
  end

  def find
  	@food = StillTasty.search(params["food"])
  	# p @food
  	render "pages/search_results.js.erb"
  end

  def api_find
    result = StillTasty.name_search(params["food"])

    render json: { results: result }
  end

end
