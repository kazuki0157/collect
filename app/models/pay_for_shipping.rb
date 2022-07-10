class PayForShipping < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '着払い希望(購入者負担)' },
    { id: 2, name: '送料込み希望(出品者負担)' }
  ]
  include ActiveHash::Associations
  has_many :items
end