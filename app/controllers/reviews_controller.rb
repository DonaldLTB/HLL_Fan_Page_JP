class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @owner = User.find(params[:user_id])
    # @review.user_id = (params[:user_id])
    @review.user = @owner
    @review.reviewer = current_user
    authorize @review

    if @review.save
      redirect_to user_path(current_user), notice: 'Review added!'
    else
      render :new
    end
  end
end
