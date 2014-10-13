class Market < ActiveRecord::Base
  has_many :vendors
  has_many :products, through: :vendors

  validates :name, :location, presence: true
end
