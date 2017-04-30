class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.includes(:uploads)
  end

end
