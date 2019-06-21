class User < ApplicationRecord
  has_many :lists

  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password

  def any_errors?
    self.errors.any?
  end

  def error_count
    self.errors.count
  end

  def error_messages
    self.errors.full_messages
  end

  def lists_count
    self.lists.count
  end

  #this method will return an array of products for a user.
  def products
    products = []
    self.lists.each do |list|
      list.products.each do |product|
        if !products.include?(product)
          products << product
        end
      end
    end
    products
  end

  #this method will return an array of all stores that a user's products are sold in
  def stores
    stores = []
    self.lists.each do |list|
      list.products.each do |product|
        product.stores.each do |store|
          if !stores.include?(store)
            stores << store
          end
        end
      end
    end
    stores
  end

  #condensed all 3 of the below methods from the original 6 methods
  def list_sample(element)
    if self.lists != []
      self.lists[element]
    end
  end

  def product_sample(element)
    if self.products != []
      self.products[element]
    end
  end

  def store_sample(element)
    if self.stores != []
      self.stores[element]
    end
  end

end
