FactoryBot.define do
  factory :credit_card do
    number { 1 }
    limit_month { 1 }
    limit_year { 1 }
    security_code { 1 }
    user_id { 1 }
  end
end
