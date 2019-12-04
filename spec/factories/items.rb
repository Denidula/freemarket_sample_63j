FactoryBot.define do
  factory :item do
    name { "MyString" }
    price { 300 }
    description { "MyString" }
    size { "MyString" }
    status { "MyString" }
    charge { "MyString" }
    delivery_method { "MyString" }
    send_date { "MyString" }
    parent_category { "MyString" }
    child_category { "MyString" }
    grandchild_category { "MyString" }
    user_id { 1 }
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end
