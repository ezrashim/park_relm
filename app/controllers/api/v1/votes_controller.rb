class Api::V1::VotesController < ActionController::Base
  protect_from_forgery with: :null_session
  # before_filter :authenticate_user!
  respond_to :html, :json, :js

  def create
    if (params[:vote][:review_id].empty? || params[:vote][:user_id].empty? || params[:vote][:vote].empty?)
      render json: :nothing, status: :not_found
      return
    end

    review

    if params[:vote][:vote] == "up"
      vote = @review.votes.new(vote: 1)
      @review.increment(:vote_count)
    else
      vote = @review.votes.new(vote: -1)
      @review.increment(:vote_count, -1)
    end

    vote.user_id = params[:vote][:user_id]
    @review.save

    if vote.save
      string = "You have #{params[:vote][:vote]} voted successfully!"
      render json: { vote_id: vote.id, flash: string}, status: :created
    else
      string = vote.errors.full_messages
      render json: { flash: string}, status: :not_found
    end
  end

  def update

    review
    @user = User.find(params[:vote][:user_id])
    @park = Park.find(params[:vote][:park_id])

    @vote = Vote.find_by(review: @review, user: @user)

    if @vote.vote == 0 && params[:vote][:vote] == "up"
      value = 1
      @review.increment(:vote_count)
    elsif @vote.vote == 0 && params[:vote][:vote] == "down"
      value = -1
      @review.increment(:vote_count, -1)
    elsif @vote.vote == -1 && params[:vote][:vote] == "up"
      value = 0
      @review.increment(:vote_count)
    elsif @vote.vote == 1 && params[:vote][:vote] == "down"
      value = 0
      @review.increment(:vote_count, -1)
    else
      string = "You can't vote twice!"
      render json: { flash: string }, status: 422
      return
    end


    if @vote.update(vote: value) && @review.save
      string = "You have successfully updated your vote!"
      render json: { flash: string }, status: :created
    else
      string = "Unable to update vote."
      render json: { flash: string} , status: :not_found
    end
  end

  private

  def review
    @review ||= Review.find(params[:vote][:review_id])
  end
end
