class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.new
      .filter_users_by("like", current_user.id)
  end

end
