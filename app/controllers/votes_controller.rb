class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :review, only: [:create, :update]
  before_action :park, only: [:create, :update]

  def create
    if params[:vote] == "up"
      vote = @review.votes.new(vote: 1)
      @review.increment(:vote_count)
    else params[:vote] == "down"
      vote = @review.votes.new(vote: -1)
      @review.increment(:vote_count, -1)
    end

    vote.user = current_user


    if vote.save && @review.save
      flash[:success] = "You have #{params[:vote]} voted successfully!"
      redirect_to park_path(@park)
    else
      flash[:notice] = vote.errors.full_messages
      render 'parks/show'
    end
  end

  def update
    vote = Vote.find_by(review: @review, user: current_user)
    value = 0

    if vote.vote == 0 && params[:vote] == "up"
      value = 1
      @review.increment(:vote_count)
    elsif vote.vote == 0 && params[:vote] == "down"
      value = -1
      @review.increment(:vote_count, -1)
    elsif vote.vote == -1 && params[:vote] == "up"
      value = 0
      @review.increment(:vote_count)
    elsif vote.vote == 1 && params[:vote] == "down"
      value = 0
      @review.increment(:vote_count, -1)
    else
      flash[:double] = "You can't vote twice!"
      redirect_to park_path(@park)
      return
    end


    if vote.update(vote: value) && @review.save
      flash[:notice] = "You have successfully updated your rating!"
      redirect_to park_path(@park)
    else
      flash.now[:notice] = "Unable to update vote."
      render 'parks/show'
    end
  end

  private

  def review
    @review ||= Review.find(params[:review_id])
  end

  def park
    @park ||= @review.park
  end
end
