FactoryBot.define do
  factory :item do
    name { "MyString" }
    price { 1 }
    description { "MyString" }
    size { "MyString" }
    status { "MyString" }
    charge { "MyString" }
    delivery_method { "MyString" }
    send_date { "MyString" }
    user_id { 1 }
    category_id { 1 }
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end
