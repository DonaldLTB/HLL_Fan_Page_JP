class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    # @users = User.all
    @users = policy_scope(User)
    # authorize @user
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new
    authorize @user
  end
end
