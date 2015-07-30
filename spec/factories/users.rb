FactoryGirl.define do
  factory :user do
    username "Iamuser"
    email "xyzuser@email.com"
    password "supersecret"
    #password_confirmation "supersecret"
    id 1
  end

end
