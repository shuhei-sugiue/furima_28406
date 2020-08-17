FactoryBot.define do
  factory :user do
    nickname              { 'sugiue' }
    email                 { 'test@test' }
    password              { '00000000' }
    password_confirmation { password }
    last_name             { '杉上' }
    first_name            { '修平' }
    last_name_kana        { 'スギウエ' }
    first_name_kana       { 'シュウヘイ' }
    birthday              { 1930 - 0o1 - 0o1 }
  end
end
