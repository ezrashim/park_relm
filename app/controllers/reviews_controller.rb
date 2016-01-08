class ReviewsController < ApplicationController


  def create
    # binding.pry
    @park = Park.find(params[:park_id])
    # binding.pry

    @review = Review.new(title: params[:review][:title], body: params[:review][:body], park: @park, user: current_user)
    # binding.pry
    # @park = @review.park


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
    params.require(:review).permit(
      :title,
      :body,)
  end
end
