class Type < ActiveRecord::Base
  has_many :condiments
  belongs_to :category
end
