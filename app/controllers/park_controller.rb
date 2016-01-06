class ParkController < ApplicationController

  def index
    @parks = Park.all
  end

end
