class Product < ApplicationRecord
  belongs_to :company
  validates_presence_of :name, :discription, :price
  validates_numericality_of :price, greater_than: 0, if: Proc.new{|p| p.price.present?}
end
