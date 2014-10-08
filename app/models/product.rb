class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :sales
  belongs_to :markets, :through => :vendors
end
