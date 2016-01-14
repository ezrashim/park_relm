class ReviewsController < ApplicationController
  before_action :review, only: [:edit, :update, :destroy]
  before_action :park, only: [:edit, :update, :destroy]

  def create
    @park = Park.find(params[:park_id])

    @review = @park.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      flash[:success] = "Review successfully created!"
      redirect_to park_path(@park)
    else
      flash[:notice] = @review.errors.full_messages
      render 'parks/show'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      flash[:notice] = "You have successfully updated your review!"
      redirect_to @park
    else
      flash.now[:notice] = "Invalid input."
      render 'reviews/edit'
    end
  end

  def destroy
    if @review.destroy
      flash[:notice] = "You have deleted review successfully!"
      redirect_to park_path(@park)
    else
      flash[:notice] = "You failed to delete review!"
      render "parks/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body)
  end

  def review
    @review ||= Review.find(params[:id])
  end

  def park
    @park ||= review.park
  end
end
