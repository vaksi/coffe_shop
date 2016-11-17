class Condiment < ActiveRecord::Base
  belongs_to :category
  belongs_to :type
end
