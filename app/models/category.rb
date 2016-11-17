class Category < ActiveRecord::Base
  has_many :menus, dependent: :destroy
  has_many :types, dependent: :destroy
  has_many :sizes, dependent: :destroy
  has_many :condiments, dependent: :destroy
end
