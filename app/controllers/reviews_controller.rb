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

  private

  def review_params
    params.require(:review).permit(:title, :body)
  end
end
