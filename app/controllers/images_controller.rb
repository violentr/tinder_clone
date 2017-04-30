class ImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = current_user.uploads
  end

  def upload
    current_user.uploads.create(image_params)
    redirect_to images_path
  end

  private

  def image_params
    params.require(:upload).permit(:image)
  end
end
