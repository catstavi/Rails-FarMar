class Market < ActiveRecord::Base
  has_many :vendors
  has_many :products, through: :vendors
end
