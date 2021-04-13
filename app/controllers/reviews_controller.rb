class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    # @reviews = Review.all
    @reviews = policy_scope(Review)
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
    #@owner = current_user
    # @review.user_id = (params[:user_id])
    #@review.user = @owner
    authorize @review

    if @review.save
      raise
      redirect_to root_path, notice: 'Review added!'
    else
      raise
      render :new, notice: "Please try again"
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
    params.require(:review).permit(:content, :topic)
    # params.require(:review).permit(:rating, :content, :reviewer_id, :user_id)
  end
end
