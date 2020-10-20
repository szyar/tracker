FactoryBot.define do
  factory :issue1, class: Issue do
    user_id { 1 }
    project_id { 1 }
    summary { 'test summary1' }
    detail { 'test detail' }
    issue_type { 'Bug' }
    priority { 'Low' }
    assigned_person { 'User1' }
    status { 'Done' }
  end
  factory :issue2, class: Issue do
    user_id { 1 }
    project_id { 1 }
    summary { 'test summary2' }
    detail { 'test detail' }
    issue_type { 'Error' }
    priority { 'High' }
    assigned_person { 'User1' }
    status { 'Doing' }
  end
  factory :issue3, class: Issue do
    user_id { 2 }
    project_id { 2 }
    summary { 'test summary3' }
    detail { 'test detail' }
    issue_type { 'Feature' }
    priority { 'High' }
    assigned_person { 'User2' }
    status { 'Done' }
  end
end
