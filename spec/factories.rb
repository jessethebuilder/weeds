FactoryGirl.define do
  sequence(:name){ |n| "A Name #{n}" }
  sequence(:email){ |n| "test#{n}@test.com" }


  factory :section do
    name SectionsHelper::SECTIONS.keys.sample
    items_pricing_scheme Pricing::SCHEMES.sample
  end

  factory :item do
    name
    section
    pricing
  end

  factory :pricing do
    scheme Pricing::SCHEMES.sample
  end


  factory :user do
    email
    password 'testtest'
  end

  factory :order do
    user
  end

  factory :order_item do
    order
    item
  end
end