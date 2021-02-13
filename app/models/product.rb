class Product < ApplicationRecord
  belongs_to :company
  validates_presence_of :name, :discription, :price
  validates_numericality_of :price, greater_than: 0, if: Proc.new{|p| p.price.present?}
  validates_presence_of :images, message: "Product should have atleast one image"
  has_many_attached :images
end
