class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  has_many :relationships, dependent: :destroy
  has_many :tradeings, through: :relationships, source: :trade_item
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'trade_item_id', dependent: :destroy
  has_many :tradeing_items, through: :reverse_of_relationships, source: :item

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

  def trade(other_item)
    unless self == other_item
      self.relationships.find_or_create_by(trade_item_id: other_item.id)
    end
  end

  def untrade(other_item)
    relationship = self.relationships.find_by(tradeitem_id: other_item.id)
    relationship.destroy if relationship
  end

end