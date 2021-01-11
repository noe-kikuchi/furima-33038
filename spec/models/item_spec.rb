require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品を出品できる場合' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない場合' do
      it '画像が空では投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end
      it '商品名が空では投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it '商品の説明が空では投稿できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'カテゴリーの情報が空では投稿できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを入力してください"
      end
      it 'カテゴリーの情報が1では投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'カテゴリーは1以外の値にしてください'
      end
      it '商品の状態についての情報が空では投稿できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を入力してください"
      end
      it '商品の状態についての情報が1では投稿できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の状態は1以外の値にしてください'
      end
      it '配送料の負担についての情報が空では投稿できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を入力してください"
      end
      it '配送料の負担についての情報が1では投稿できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '配送料の負担は1以外の値にしてください'
      end
      it '発送元の地域についての情報が空では投稿できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "配送元の地域を入力してください"
      end
      it '発送元の地域についての情報が空では投稿できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '配送元の地域は1以外の値にしてください'
      end
      it '発送までの日数についての情報が空では投稿できない' do
        @item.feescheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "配送までの日数を入力してください"
      end
      it '発送までの日数についての情報が1では投稿できない' do
        @item.feescheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '配送までの日数は1以外の値にしてください'
      end
      it '価格が空では投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "価格を入力してください"
      end
      it '価格の範囲が、¥300以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は299より大きい値にしてください'
      end
      it '価格の範囲が、¥9,999,999以上だと登録できない' do
        @item.price = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は10000000より小さい値にしてください'
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は数値で入力してください'
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Userを入力してください"
      end
    end
  end
end
