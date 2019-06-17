class PersonalsController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @personals = @user.personal
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
