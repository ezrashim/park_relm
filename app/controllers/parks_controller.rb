class ParksController < ApplicationController

  def index

    @parks = Park.all
    # binding.pry
  end

  def show

    @park = Park.find(params[:id])
    # binding.pry
  end
end
