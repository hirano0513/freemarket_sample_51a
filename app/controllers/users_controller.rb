class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def show
  end

  def edit
  end

  def update
    if @user.update(profile_params)
      redirect_to controller: :users, action: :edit
    else
      flash[:notice] = "エラーが発生しました"
      redirect_to controller: :users, action: :edit
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  private
  def profile_params
    params.require(:user).permit(:nickname, :profile)
  end

end
