# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'test1', email: 'test1@gmail.com',
              password: 'hellotest1')

User.create(username: 'test2', email: 'test2@gmail.com',
              password: 'hellotest2')

User.create(username: 'test3', email: 'test3@gmail.com',
              password: 'hellotest3')

User.create(username: 'test4', email: 'test4@gmail.com',
              password: 'hellotest4')

User.create(username: 'test5', email: 'test5@gmail.com',
              password: 'hellotest5')

User.create(username: 'test6', email: 'test6@gmail.com',
              password: 'hellotest6')

User.create(username: 'test7', email: 'test7@gmail.com',
              password: 'hellotest7')

User.create(username: 'test8', email: 'test8@gmail.com',
              password: 'hellotest8')

Project.create(name: 'test_project_1', description: 'test project 1 description',
                owner_id: 6)

Project.create(name: 'test_project_2', description: 'test project 2 description',
                owner_id: 7)

Project.create(name: 'test_project_3', description: 'test project 3 description',
                owner_id: 4)

Project.create(name: 'test_project_4', description: 'test project 4 description',
                owner_id: 5)

Project.create(name: 'test_project_5', description: 'test project 5 description',
                owner_id: 6)

ProjectMember.create(role: 'Developer', user_id: 4, project_id: 3)
ProjectMember.create(role: 'Tester', user_id: 6, project_id: 1)
ProjectMember.create(role: 'Developer', user_id: 7, project_id: 2)
ProjectMember.create(role: 'Tester', user_id: 5, project_id: 4)
ProjectMember.create(role: 'Developer', user_id: 6, project_id: 5)
ProjectMember.create(role: 'Developer', user_id: 5, project_id: 2)
ProjectMember.create(role: 'Developer', user_id: 2, project_id: 3)

Issue.create(user_id: 4, project_id: 12, summary: 'add sorting feature',
              detail: 'sort by type, status, priority and dates',
              issue_type: 'Feature', priority: 2, assigned_person: 5,
              status: 'Assigned')

Issue.create(user_id: 5, project_id: Project.first, summary: 'test issue 1',
              detail: 'test detail 1', issue_type: 'Other',
              priority: 1, assigned_person: 5, status: 'Assigned')

Issue.create(user_id: 6, project_id: Project.first, summary: 'test issue 2',
              detail: 'test detail 2', issue_type: 'Bug',
              priority: 3, assigned_person: 6, status: 'Assigned')

Issue.create(user_id: 4, project_id: Project.first, summary: 'test issue 3',
              detail: 'test detail 3', issue_type: 'Error',
              priority: 1, assigned_person: 4, status: 'Assigned')

Issue.create(user_id: 5, project_id: Project.first, summary: 'test issue 4',
              detail: 'test detail 1', issue_type: 'Fatal',
              priority: 1, assigned_person: 5, status: 'Assigned')

Issue.create(user_id: 6, project_id: Project.first, summary: 'test issue 5',
              detail: 'test detail 1', issue_type: 'Other',
              priority: 1, assigned_person: 6, status: 'Assigned')

Comment.create(user_id: 6, issue_id: 10, content: 'test comment')
Comment.create(user_id: 4, issue_id: 1, content: 'test comment')
Comment.create(user_id: 5, issue_id: 1, content: 'test comment')
Comment.create(user_id: 6, issue_id: 1, content: 'test comment')
Comment.create(user_id: 4, issue_id: 1, content: 'test comment')
Comment.create(user_id: 5, issue_id: 1, content: 'test comment')
Comment.create(user_id: 6, issue_id: 1, content: 'test comment')
