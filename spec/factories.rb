FactoryGirl.define do
  sequence(:name){ |n| "A Name #{n}" }
  sequence(:email){ |n| "tests#{n}@tests.com" }


  factory :section do
    name SectionsHelper::SECTIONS.keys.sample
    items_pricing_scheme Pricing::SCHEMES.sample
  end

  factory :item do
    name
    section
    pricing

    factory :item_priced_per_weight do
      pricing :pricing_per_weight
    end
  end

  factory :pricing do
    scheme Pricing::SCHEMES.sample

    factory :pricing_per_weight do
      scheme 'weight'
    end
  end


  factory :user do
    email
    password 'test8888'
  end

  factory :order do
  end

  factory :order_item do
    quantity Pricing::WEIGHTS.keys.sample
    order
    item

    factory :order_item_priced_per_weight do
      item :item_priced_per_weight
    end
  end
end