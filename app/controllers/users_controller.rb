class UsersController < ApplicationController
  def index
    likes = Like.pluck(:liked_user_id)
    users = User.includes(:uploads) - User.find(likes)
    @user = users.first
  end

  def attitude
    user = User.find(params[:attitude][:user_id])
    Like.create(user_id: current_user.id, liked_user_id: user.id)
    redirect_to users_path
  end
end
