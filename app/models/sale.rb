class Sale < ActiveRecord::Base
  belongs_to :product

  validates :amount, :purchase_time, :product_id, :vendor_id, presence: true
end
