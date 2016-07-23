class PhotosController < ApplicationController
  # before_action :find_photo
  def index

  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
  end

  private

  def find_photo

  end

  def photo_params
    params.require(:photo).permit(:title, :description)
  end
end
