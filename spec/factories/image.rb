FactoryGirl.define do
  factory :image do
    attachment { File.new("#{Rails.root}/spec/fixtures/b737_5.jpg") }
  end
end
