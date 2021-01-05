class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :feescheduled_delivery
  
  
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id, numericality: { other_than: 1 } 
    validates :state_id, numericality: { other_than: 1 } 
    validates :delivery_fee_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :feescheduled_delivery_id, numericality: { other_than: 1 } 
    validates :price, numericality: {greater_than: 300,less_than: 9999999}
  end

end

