class Store < ApplicationRecord
  has_many :productstores
  has_many :products, through: :productsores

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true, uniqueness: true
  
end
