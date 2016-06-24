FactoryGirl.define do
  factory :model_b do
    model_a nil
    column_a "MyString"
    column_b 1
    column_c false
  end
end
