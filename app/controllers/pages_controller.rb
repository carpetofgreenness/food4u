require "stilltasty"
class PagesController < ApplicationController

  def home
  end

  def test_api
  	@food = StillTasty.search("cucumber")
  end

  def find
  	@food = params["food"]
  end

end
