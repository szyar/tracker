FactoryBot.define do
  factory :project_member1, class: ProjectMember do
    role { 'Developer' }
    user_id { 1 }
    project_id { 1 }
  end
end
