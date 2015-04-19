class Resource < ActiveRecord::Base
  has_many :ingredients
  has_many :products, :through => :ingredients
end
