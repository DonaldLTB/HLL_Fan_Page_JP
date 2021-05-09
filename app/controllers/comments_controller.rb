class CommentsController < ApplicationController
  before_action :find_user, only: [ :new, :create ]
  before_action :find_review, only: [ :new, :create ]
  skip_before_action :authenticate_user!, only: :index

  def index
    @comments = policy_scope(Comment)
  end

  def show
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def new
    @comment = Comment.new
    authorize @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = @user
    @comment.review = @review
    authorize @comment
    if @comment.save
      redirect_to user_review_path(@review.user.id, @review.id), notice: 'Topic Added!'
    else
      render :new, notice: "Please try again"
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_review
    @review = Review.find(params[:review_id])
  end

  def comment_params
    params.require(:comment).permit(:reply, photos: [])
  end
end
