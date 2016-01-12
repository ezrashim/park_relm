class VotesController < ApplicationController
  def create

    review = Review.find(params[:review_id])
    @park = review.park
    vc = review.vote_count

    if params[:vote] == "up"
      vote = review.votes.new(vote: 1)
      vc += 1
      review.increment(:vote_count)
    elsif params[:vote] == "down"
      vote = review.votes.new(vote: -1)
      vc -= 1
      review.increment(:vote_count, -1)
    else
      vote = review.votes.new
    end

    vote.user = current_user
    # binding.pry
    review.save

    if vote.save
      flash[:success] = "You have #{params[:vote]} voted successfully!"
      redirect_to park_path(@park)
    else
      flash[:notice] = vote.errors.full_messages
      render 'parks/show'
    end

  end

  def update
    review = Review.find(params[:review_id])
    @park = review.park

    vote = Vote.where(review: review, user: current_user).first

    if vote.vote == 0 && params[:vote] == "up"
      vote.update(vote: 1)
    elsif vote.vote == 0 && params[:vote] == "down"
      vote.update(vote: -1)
    elsif vote.vote == -1 && params[:vote] == "up"
      vote.update(vote: 0)
    elsif vote.vote == 1 && params[:vote] == "down"
      vote.update(vote: 0)
    else
      flash[:double] = "You can't vote twice!"
      redirect_to park_path(@park)
      return
    end

    if vote.save
      flash[:notice] = "You have successfully updated your rating!"
      redirect_to park_path(@park)
    else
      flash.now[:notice] = "Unable to update vote."
      render 'parks/show'
    end
  end

  private

  def vote_params
    params.permit(:vote)
  end

  def review
    @review ||= Review.find(params[:id])
  end

  def park
    @park ||= review.park
  end
end
