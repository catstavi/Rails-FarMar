class Product < ActiveRecord::Base
  #belongs_to :vendor
  has_many :sales
  has_many :vendors, :through => :sales
end
