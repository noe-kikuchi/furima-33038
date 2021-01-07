class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :feescheduled_delivery

  belongs_to :user
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :feescheduled_delivery_id
    end
    validates :price, numericality: { greater_than: 300, less_than: 9_999_999 }
  end
end
