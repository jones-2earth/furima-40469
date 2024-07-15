class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one_attached :image

  validates :content, presence: true
end
