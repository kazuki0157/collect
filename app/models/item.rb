class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order

  has_many :item_relationships,
           class_name: 'Relationship',
           foreign_key: 'trade_item_id',
           dependent: :destroy,
           inverse_of: :item

  has_many :trad_item_relationships,
           class_name: 'Relationship',
           foreign_key: 'item_id',
           dependent: :destroy,
           inverse_of: :trade_item

  has_many :items, through: :item_relationships
  has_many :trade_items, through: :trad_item_relationships

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

  #def trade(other_item)
  #  relationships.find_or_create_by(trade_item_id: other_item.id) unless self == other_item
  #end

  #def untrade(other_item)
  #  relationship = relationships.find_by(tradeitem_id: other_item.id)
  #  relationship.destroy if relationship
  #end
end
