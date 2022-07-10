class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :pay_for_shipping
  belongs_to :ken_name
  belongs_to :shipping_days

end