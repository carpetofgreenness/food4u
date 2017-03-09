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

end
