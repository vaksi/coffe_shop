class Size < ActiveRecord::Base
  has_many :prices, dependent: :destroy
  belongs_to :category
end
