class Product < ApplicationRecord
  has_many :listproducts
  has_many :lists, through: :listproducts
  has_many :users, through: :lists

  has_many :productstores
  has_many :stores, through: :productstores
  
end
