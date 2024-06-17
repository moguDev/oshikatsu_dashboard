class Good < ApplicationRecord
  validates :user_id, uniqueness: { scope: :item_id }

  belongs_to :user
  belongs_to :item
end
