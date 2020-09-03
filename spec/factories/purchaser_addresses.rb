FactoryBot.define do
  factory :purchaser_address do
    zip_code          {"631-0806"}
    province          {2}
    municipal         {"奈良"}
    street_number     {"2-5"}
    telephone         {"08012345678"}
    token             {"test"}
  end
end
