class UsersController < ApplicationController
  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(profile_params)
    redirect_to controller: :users, action: :edit
  end

  private
  def profile_params
    params.require(:user).permit(:nickname, :profile)
  end

end
