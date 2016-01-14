class VotesController < ApplicationController
  before_action :review, only: [:create, :update]
  before_action :park, only: [:create, :update]

  def create
    if params[:vote] == "up"
      vote = @review.votes.new(vote: 1)
      @review.increment(:vote_count)
    elsif params[:vote] == "down"
      vote = @review.votes.new(vote: -1)
      @review.increment(:vote_count, -1)
    else
      vote = @review.votes.new
    end

    vote.user = current_user
    @review.save

    if vote.save
      flash[:success] = "You have #{params[:vote]} voted successfully!"
      redirect_to park_path(@park)
    else
      flash[:notice] = vote.errors.full_messages
      render 'parks/show'
    end
  end

  def update
    vote = Vote.where(review: @review, user: current_user).first

    if vote.vote == 0 && params[:vote] == "up"
      vote.update(vote: 1)
      @review.increment(:vote_count).save
    elsif vote.vote == 0 && params[:vote] == "down"
      vote.update(vote: -1)
      @review.increment(:vote_count, -1).save
    elsif vote.vote == -1 && params[:vote] == "up"
      vote.update(vote: 0)
      @review.increment(:vote_count).save
    elsif vote.vote == 1 && params[:vote] == "down"
      vote.update(vote: 0)
      @review.increment(:vote_count, -1).save
    else
      flash[:double] = "You can't vote twice!"
      redirect_to park_path(@park)
      return
    end


    if vote.persisted?
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
