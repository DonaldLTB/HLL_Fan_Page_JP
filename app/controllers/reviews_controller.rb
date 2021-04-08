class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
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

  def edit
    @review = Review.find(params[:id])
    authorize @review
  end

  def update
    @review = Review.find(params[:id])
    authorize @review
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def review_params
    params.require(:review).permit(:content, :reviewer_id)
    # params.require(:review).permit(:rating, :content, :reviewer_id, :user_id)
  end
end
