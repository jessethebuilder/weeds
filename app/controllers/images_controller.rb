class ImagesController < ApplicationController
  before_action :set_image, only: [:destroy]

  def destroy
    @image.remove_image!
    @image.delete
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to eval("edit_#{@image.has_images_type.downcase}_path(@image.has_images)")
    else
      redirect_to eval("edit_#{@image.has_images_type.downcase}_path(@image.has_images)")
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.require(:image).permit(:image, :description, :has_images_type, :has_images_id, :remote_image_url)
  end
end