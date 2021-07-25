class UsersController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index show]
  def index
    # @users = User.all
    @users = policy_scope(User)
    # authorize @user
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    # add to only allow current_user
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:id, :bio, :avatar, :username, :discord, :role, :steam_name)
  end
end
