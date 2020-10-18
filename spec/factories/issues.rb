FactoryBot.define do
  factory :issue1, class: Issue do
    user_id { 4 }
    project_id { 2 }
    summary { 'test summary1' }
    detail { 'test detail' }
    issue_type { 'Bug' }
    priority { 'High' }
    assigned_person { 'user2' }
    status { 'Init' }
  end
  factory :issue2, class: Issue do
    user_id { 4 }
    project_id { 2 }
    summary { 'test summary2' }
    detail { 'test detail' }
    issue_type { 'Feature' }
    priority { 'High' }
    assigned_person { 'user2' }
    status { 'Init' }
  end
end
