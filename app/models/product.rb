class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :sales

  validates :name, :vendor_id, presence: true
end
