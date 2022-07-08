FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'１q１q１q'}
    password_confirmation {password}
  end
end