FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    delivery_region_id { 2 }
    city { '東京都' }
    address_first { '1-1' }
    address_second { '東京ハイツ' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end