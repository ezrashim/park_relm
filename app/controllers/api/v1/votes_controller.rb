class Api::V1::VotesController < ActionController::Base
  protect_from_forgery with: :null_session
  # before_filter :authenticate_user!
  respond_to :html, :json, :js

  def create
    if (params[:vote][:review_id].empty? || params[:vote][:user_id].empty? || params[:vote][:vote].empty?)
      render json: :nothing, status: :not_found
      # render json: { status: created, vote: @vote }
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
      render json: { flash: string}, status: :created
    else
      string = vote.errors.full_messages
      render json: { flash: string}, status: :not_found
    end
  end

  def update
    # @park = Park.find(params[:vote][:park_id])
    # binding.pry
    # @reviews = @park.reviews
    @user = current_user
    @vote = Vote.where(user: params[:user_id], review: params[:review_id]).first
    @review = @vote.review
    @votes = @review.votes

    vote!
    vote_count?

    render json: {}, status: :created

    # if @vote.vote.nil? && params[:vote][:vote] == "up"
    #
    #   @vote.vote = true
    #   review.increment(:vote_count)
    #
    # elsif @vote.vote == 0 && params[:vote][:vote] == "down"
    #   @vote.update(vote: -1)
    #   review.increment(:vote_count, -1)
    # elsif @vote.vote == -1 && params[:vote][:vote] == "up"
    #
    #   @vote.update(vote: 0)
    #   review.increment(:vote_count)
    #
    # elsif @vote.vote == 1 && params[:vote][:vote] == "down"
    #   @vote.update(vote: 0)
    #   review.increment(:vote_count, -1)
    # else
    #   string = "You can't vote twice!"
    #   render json: { flash: string }, status: 422
    # end

    # review.save

  #   if @vote.save
      # string = "You have successfully updated your vote!"
      # render json: { flash: string }, status: :created
  #   else
  #     string = "Unable to update vote."
  #     render json: { flash: string} , status: :not_found
  #   end
  end

  private

  # def vote_count?
  #   @votes = review.votes
  #   count = 0
  #   @votes.each do |vote|
  #     if vote.vote
  #       count += 1
  #     elsif vote.vote == false
  #       count -= 1
  #     elsif vote.vote.nil?
  #       count += 0
  #     end
  #   end
  #   count
  # end
  #
  # def vote!
  #   if params[:vote] == "up"
  #     @vote.vote = true
  #   elsif params[:vote] == "down"
  #     @vote.vote = false
  #   else
  #     @vote.vote = nil
  #   end
  # end

  def review
    @review ||= Review.find(params[:vote][:review_id])
  end
end
