class Order < ApplicationRecord
  belongs_to :relationship
  validates :relationship_id, presence: true
end
