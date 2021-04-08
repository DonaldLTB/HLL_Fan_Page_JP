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
    @team = Team.find(params[:id])
    authorize @team
  end

  def update
    @team = Team.find(params[:id])
    authorize @team
    @team.update(team_params)
    redirect_to team_path(@team)
  end
end
