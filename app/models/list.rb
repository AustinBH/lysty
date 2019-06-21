class List < ApplicationRecord
  belongs_to :user
  has_many :list_products
  has_many :products, through: :list_products

  validates :title, presence: true

  def add_list_product(product)
    ListProduct.create(list: self, product: product)
  end

  def filter_list(products)
    @stores = []
    all_stores = Store.all
    products.each do |product|
      all_stores.each do |store|
        if store.products.include?(product) && !@stores.include?(store)
          @stores << store
        end
      end
    end
    @stores
  end

end
