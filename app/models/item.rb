class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :trade

  validates :image, presence: true
  validates :product_name, presence: true
  validates :description, presence: true
  validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :pay_for_shipping_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :ken_name_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_days_id, numericality: { other_than: 0, message: "can't be blank" }
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :pay_for_shipping
  belongs_to :ken_name
  belongs_to :shipping_days

end