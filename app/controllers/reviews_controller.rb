class ReviewsController < ApplicationController
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
    @review = Review.find(params[:id])
    @park = @review.park
  end

  def update
    @review = Review.find(params[:id])
    @park = @review.park

    @review.update(review_params)

    if @review.save
      flash[:notice] = "You have successfully updated your review!"
      redirect_to @park
    else
      flash.now[:notice] = "Invalid input."
      render 'reviews/edit'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body)
  end
end
