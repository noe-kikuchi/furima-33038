FactoryBot.define do
  factory :buy_ship do
    postal_code { '797-0035' }
    prefecture_id { 3 }
    city { '西予市' }
    address { '宇和町' }
    building_name { '赤城山レッドサンズ' }
    phone_number { '09097791996' }
    token { 'tok_abcdefghijk00000000000000000' }
    item_id { 1 }
    user_id { 1 }
  end
end
