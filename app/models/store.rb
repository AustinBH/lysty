class Store < ApplicationRecord
  has_many :product_stores
  has_many :products, through: :product_stores

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :website, presence: true

  #refactoring product count methods into one command
  def product_count
    self.products.count
  end

  #adding method to sort stores by their product count
  def self.most_products
    self.all.sort_by do |store|
      -store.product_count
    end
  end

end
