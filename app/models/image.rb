class Image < ActiveRecord::Base
  belongs_to :has_images, :polymorphic => true
  mount_uploader :image, ImageUploader

  validates :image, :presence => true
end
