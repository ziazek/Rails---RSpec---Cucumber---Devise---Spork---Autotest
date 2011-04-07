Factory.define :user do |f|
  f.sequence(:email) {|n| "person_#{n}@email.com" }
  f.password "abcd1234"
  f.password_confirmation "abcd1234"
end