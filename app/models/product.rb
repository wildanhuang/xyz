class Product < ActiveRecord::Base
  has_many :ingredients
  has_many :resources, :through => :ingredients
  has_many :sales
end
