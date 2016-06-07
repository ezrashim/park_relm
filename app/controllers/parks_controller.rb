class ParksController < ApplicationController
  before_action :authorize_user, only: [:destroy]
  before_action :park, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search] == ""
      parks = Park.none
    elsif params[:search]
      parks = Park.where("title ILIKE ?", "%#{params[:search]}%")
    else
      parks = Park.all
    end

    parks.sort_by do |p|
      p.reviews.average(:rating).to_f
    end
    @parks = parks.page params[:page]
    # @parks = parks.order(rating: :desc).page params[:page]
  end

  def show
    @review = Review.new
    park_reviews = Review.where(park_id: park)
    @reviews = park_reviews.order(created_at: :desc).page params[:page]
    @rating = @park.reviews.average(:rating)
    if @rating.nil?
      @rating = "N/A"
    else
      @rating = @rating.round(1)
    end
  end

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    @park.user_id = current_user.id

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
      :baseball,
      :user_id
    )
  end
end
