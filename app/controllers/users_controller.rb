class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.filter_voted_users.first
  end

  def attitude
    liked = params[:like]
    user = User.find(params[:attitude][:user_id])
    if liked.present?
      user.liked_by current_user, :vote_scope => 'like'
    end
    user.disliked_by current_user, :vote_scope => 'dislike'
    redirect_to users_path
  end
end
