class GraphController < ApplicationController

  def index
  end
 
  def data
    respond_to do |format|
      format.json {
        render :json => Graveyard.make_table
      }
    end
  end


end
