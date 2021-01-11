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
      it 'building_nameが空であっても購入できること' do
        @buy_ship.building_name = ""
        @buy_ship.valid?
      end
    end
    context '商品を購入できない場合' do
      it 'postal_codeが空では投稿できない' do
        @buy_ship.postal_code = ''
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "郵便番号を入力してください"
      end
      it '郵便番号にはハイフンが必要であること' do
        @buy_ship.postal_code = 7_970_035
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "郵便番号は不正な値です"
      end
      it 'prefecture_idが空では投稿できない' do
        @buy_ship.prefecture_id = ''
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "都道府県を入力してください"
      end
      it 'prefecture_idが1では投稿できない' do
        @buy_ship.prefecture_id = '1'
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "都道府県は1以外の値にしてください"
      end
      it 'cityが空では投稿できない' do
        @buy_ship.city = ''
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "市町村を入力してください"
      end
      it 'addressが空では投稿できない' do
        @buy_ship.address = ''
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "番地を入力してください"
      end
      it 'phone_numberが空では投稿できない' do
        @buy_ship.phone_number = ''
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "電話番号を入力してください"
      end
      it '電話番号にはハイフンがあると登録できない' do
        @buy_ship.phone_number = '090-9779-1996'
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include '電話番号は不正な値です'
      end
      it '電話番号には11桁以上であると登録できない' do
        @buy_ship.phone_number = '111111111111'
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "電話番号は不正な値です"
      end
      it 'item_idが空では登録できないこと' do
        @buy_ship.item_id = nil
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "Itemを入力してください"
      end
      it 'user_idが空では登録できないこと' do
        @buy_ship.user_id = nil
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "Userを入力してください"
      end
      it 'tokenが空では登録できないこと' do
        @buy_ship.token = nil
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include "クレジットカード情報を入力してください"
      end
    end
  end
end
