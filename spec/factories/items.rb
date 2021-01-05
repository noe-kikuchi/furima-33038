FactoryBot.define do
  factory :item do
    name                     {Faker::Name.name}
    info                     {Faker::Lorem.sentence}
    category_id              {3}
    state_id                 {3}
    delivery_fee_id          {3}
    prefecture_id            {3}
    feescheduled_delivery_id {3}
    price                    {Faker::Number.within(range: 300..9999999)}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/8ball.png'), filename: '8ball.png')
    end 
  end
end

