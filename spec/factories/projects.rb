FactoryBot.define do
  factory :project1, class: Project do
    name { 'test project' }
    description { 'test description' }
    owner_id { 1 }
  end
end
