class Image < ActiveRecord::Base
  belongs_to :has_images, :polymorphic => true
  mount_uploader :image, ImageUploader

  def full_url
    URI.parse(ASSET_HOST + image_url)
  end
end
