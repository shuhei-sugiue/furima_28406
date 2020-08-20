FactoryBot.define do
  factory :item do
    name                  {"商品"}
    discription           {"商品説明"}
    price                 {"1000"}
    category_id           {"2"}
    shipper_id            {"2"}
    ship_date_id          {"2"}
    state_id              {"2"}
    charge_id             {"2"}
    
    association :user
  end
end
