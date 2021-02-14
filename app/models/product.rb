class Product < ApplicationRecord
  attr_accessor :images_to_be_deleted
  belongs_to :company
  validates_presence_of :name, :discription, :price
  validates_numericality_of :price, greater_than: 0, if: Proc.new{|p| p.price.present?}
  validates_presence_of :images, message: "Product should have atleast one image"
  has_many_attached :images
  validates :images, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
            if: Proc.new{|p| p.images.collect(&:new_record?).include?(true)}
  validate :deleting_images, if: Proc.new{|p| p.images_to_be_deleted.present?}
  before_save :delete_images, if: Proc.new{|p| p.images_to_be_deleted.present?}
  
  private
    def deleting_images
      left_images = images.pluck(:id) - images_to_be_deleted.split(",").map(&:to_i)
      if left_images.empty?
        errors.add(:images, "Product should have atleast one image")
      end
    end
    
    def delete_images
      images.where(id: images_to_be_deleted.split(",").map(&:to_i)).destroy_all
    end
end
