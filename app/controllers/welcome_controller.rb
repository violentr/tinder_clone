class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.filter_users_by("like")
  end

end
