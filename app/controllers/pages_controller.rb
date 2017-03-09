require "stilltasty"
class PagesController < ApplicationController

  def home
  	@food = StillTasty.search("apple")
  end

end
