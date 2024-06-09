FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name }
    item_describe { Faker::Lorem.paragraph(sentence_count: 3) }
    category_id { Faker::Number.between(from: 2, to: 10) }
    condition_id { Faker::Number.between(from: 2, to: 6) }
    delivery_charge_id { 2 }
    delivery_region_id { Faker::Number.between(from: 2, to: 47) }
    delivery_day_id { Faker::Number.between(from: 2, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('public/test_image.jpg'), 'image/jpeg') }
    user_id { FactoryBot.create(:user).id }

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('public/test_image.jpg')), filename: 'test_image.jpg',
                        content_type: 'image/jpeg')
    end
  end
end
