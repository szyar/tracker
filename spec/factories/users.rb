FactoryBot.define do
  factory :user1, class: User do
    username { 'User1' }
    email { 'user1@gmail.com' }
    password { 'hellouser1' }
  end

  factory :user2, class: User do
    username { 'User2' }
    email { 'user2@gmail.com' }
    password { 'hellouser2' }
  end

  factory :user3, class: User do
    username { 'User3' }
    email { 'user3@gmail.com' }
    password { 'hellouser3' }
  end

end
