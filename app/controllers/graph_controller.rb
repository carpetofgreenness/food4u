class GraphController < ApplicationController
  def index
  end

  def data
    # result = [ [1,5], [20,20], [40,10], [60,40], [80,5], [100,60]]

    result = Graveyard.make_table

    render json: { results: result }
  end
end