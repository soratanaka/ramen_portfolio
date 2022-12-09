FactoryBot.define do
  factory :post do
    content                 {"test_1"}
    shop
    user
  end

  factory :second_post , class: Post do
    content                 {"test_2"}
    shop
    user
  end
end
