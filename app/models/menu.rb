class Menu < ActiveRecord::Base
  belongs_to :category
  has_many :prices, dependent: :destroy
  has_many :order_items, dependent: :destroy
end
