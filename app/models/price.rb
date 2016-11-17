class Price < ActiveRecord::Base
  belongs_to :size
  belongs_to :menu
  has_many :order_items, dependent: :destroy
end
