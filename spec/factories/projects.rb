FactoryBot.define do
  factory :project1, class: Project do
    name { 'test project' }
    description { 'test description' }
    owner_id { 1 }
  end
  factory :project2, class: Project do
    name { 'test project 1' }
    description { 'test description 1' }
    owner_id { 6 }
  end
end
