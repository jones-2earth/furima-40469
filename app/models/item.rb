class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture_id
  belongs_to :category_id
  belongs_to :item_condition_id
  belongs_to :postage_payer_id
  belongs_to :preparation_day_id

  belongs_to :user
  has_one    :order

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :category_id
    validates :item_condition_id
    validates :postage_payer_id
    validates :preparation_day_id
  end

  with_options presence: true do
    validates :user
    validates :name
    validates :price
    validates :item_description
    validates :category_id
    validates :item_condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :preparation_day_id
  end
  
end
