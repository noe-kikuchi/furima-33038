FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {password}
    lastname              {"孫"}
    firstname             {"悟空"}
    lastname_kana         {"ソン"}
    firstname_kana        {"ゴクウ"}
    birth_date_id         {1996-01-15}
  end
end