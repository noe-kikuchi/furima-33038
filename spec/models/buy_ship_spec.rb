require 'rails_helper'

RSpec.describe BuyShip, type: :model do
  before do
    @buy_ship = FactoryBot.build(:buy_ship)
  end

  describe '商品の購入' do
    context '商品を購入できる場合' do
      it '全ての項目の入力が存在すれば購入できること' do
        expect(@buy_ship).to be_valid
      end
    end
    context '商品を出品できる場合' do
      it 'postal_codeが空では投稿できない' do
        @buy_ship.postal_code = ""
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号にはハイフンが必要であること' do
        @buy_ship.postal_code = 7970035
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "Postal code is invalid"
      end
      it 'prefecture_idが空では投稿できない' do
        @buy_ship.prefecture_id = ""
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが1では投稿できない' do
        @buy_ship.prefecture_id = "1"
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'cityが空では投稿できない' do
        @buy_ship.city = ""
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空では投稿できない' do
        @buy_ship.address = ""
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空では投稿できない' do
        @buy_ship.phone_number = ""
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号にはハイフンがあると登録できない' do
        @buy_ship.phone_number = "090-9779-1996"
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "Phone number is invalid"
      end
      it '電話番号には11桁以上であると登録できない' do
        @buy_ship.phone_number = "111111111111"
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "Phone number is invalid"
      end
    end
  end
end
