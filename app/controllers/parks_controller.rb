class ParksController < ApplicationController
  before_action :authorize_user, only: [:destroy]
  before_action :park, only: [:show, :edit, :update, :destroy]

  def index
    @parks = Park.all
  end

  def show
    park
    @review = Review.new
  end

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    if @park.save
      flash[:success] = "Park successfully created!"
      redirect_to root_path
    else
      flash[:notice] = @park.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @park.update(park_params)
      flash[:notice] = "You have successfully updated your question!"
      redirect_to @park
    else
      flash.now[:notice] = "Invalid input."
      render 'edit'
    end
  end

  def destroy
    if @park.destroy
      flash[:notice] = "You have deleted park successfully!"
      redirect_to root_path
    else
      flash[:notice] = "You failed to delete park!"
      render :show
    end
  end

  private

  def park
    @park ||= Park.find(params[:id])
  end

  def park_params
    params.require(:park).permit(
      :title,
      :location,
      :rating,
      :bathroom,
      :picnic,
      :pets,
      :basketball,
      :baseball
    )
  end
end
