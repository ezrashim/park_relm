class ReviewsController < ApplicationController
  def create
    @park = Park.find(params[:park_id])
    @review = Review.new(review_params)

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
    r_params = params.require(:review).permit(:title, :body)
    r_params.store(:park_id, params[:park_id])
    r_params.store( :user_id, current_user.id)
    return r_params
  end
end
