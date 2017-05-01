class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    likes = Like.all.pluck(:liked_user_id)
    @users = User.find(likes)
  end

end
