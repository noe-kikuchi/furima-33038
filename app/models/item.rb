class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :feescheduled_delivery_id, :price, :image).merge(user_id: curent_user.id)
  end
end
