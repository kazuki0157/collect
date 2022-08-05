class Relationship < ApplicationRecord
  belongs_to :item, class_name: 'Item'
  belongs_to :trade_item, class_name: 'Item'

  validates :item_id, presence: true
  validates :trade_item_id, presence: true
end
