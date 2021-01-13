class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @nickname = @user.nickname
    @dogs = @user.dogs
  end

  def edit
    @nickname = @user.nickname
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render edit_user_path(current_user)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :prefecture_id, :city, :sex_id, :age_id)
  end

end
