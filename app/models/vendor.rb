class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :sales, through: :products
  has_many :products
end
