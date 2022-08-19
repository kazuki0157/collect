class Order < ApplicationRecord
  belongs_to :relationship
  validate :relationship_id
end
