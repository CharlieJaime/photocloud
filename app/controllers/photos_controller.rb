class PhotosController < ApplicationController
  before_action :find_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all.order("created_at DESC")
  end

  def show
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(photo_params)

    if @photo.save
      redirect_to @photo, notice: "Successfully uploaded!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: "Successfully updated!"
    else
      render 'update'
    end
  end

  def destroy
    @photo.destroy
    redirect_to root_path
  end

  private

  def find_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:image, :title, :description)
  end
end
