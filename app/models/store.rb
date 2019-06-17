class Store < ApplicationRecord
  has_many :productstores
  has_many :products, through: :productsores
end
