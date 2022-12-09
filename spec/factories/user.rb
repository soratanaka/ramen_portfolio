FactoryBot.define do
  factory :admin_user, class: User do
    name { '管理者' }
    email { Faker::Internet.free_email }
    password { 'testtest' }
    password_confirmation {'testtest' }
    admin {'ture'}
    after(:create) {|user| user.confirm}
  end
  factory :user , class: User do
    name { 'ユーザー' }
    email { Faker::Internet.free_email }
    password { 'testtest' }
    password_confirmation {'testtest' }
    admin {'false'}
    after(:create) {|user| user.confirm}
  end
end