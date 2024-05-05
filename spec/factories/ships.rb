FactoryBot.define do
  factory :ship do
    record { nil }
    postcode { "MyString" }
    area_id { 1 }
    city { "MyString" }
    street { "MyString" }
    building { "MyString" }
    phone { "MyString" }
  end
end
