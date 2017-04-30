class UsersController < ApplicationController
  def index
    users = User.includes(:uploads)
    @user = users.first
  end

  def attitude
    redirect_to users_path
  end
end
