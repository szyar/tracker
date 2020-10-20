FactoryBot.define do
  factory :project_member1, class: ProjectMember do
    role { 'Developer' }
    user_id { 1 }
    project_id { 1 }
  end
  factory :project_member2, class: ProjectMember do
    role { 'Developer' }
    user_id { 6 }
    project_id { 2 }
  end
end
