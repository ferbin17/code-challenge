class Company < ApplicationRecord
  has_rich_text :description
  has_many :products
end
