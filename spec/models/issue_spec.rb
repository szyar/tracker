require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe 'Validation test' do
    context 'If the summary is empty' do
      it 'Can\'t register an issue without providing summary' do
        issue = Issue.new(user_id: 1, project_id: 1, summary: '', detail: 'test detail', issue_type: 'Bug',
                          priority: 'High', assigned_person: 'User1', status: 'Init')
        expect(issue).not_to be_valid
      end
    end
    context 'If the detail is empty' do
      it 'Can\'t register an issue without providing detail' do
        issue = Issue.new(user_id: 1, project_id: 1, summary: 'test summary', detail: '', issue_type: 'Bug',
          priority: 'High', assigned_person: 'User1', status: 'Init')
        expect(issue).not_to be_valid
      end
    end
    context 'If the issue_type is empty' do
      it 'Can\'t register an issue without providing issue_type' do
        issue = Issue.new(user_id: 1, project_id: 1, summary: 'test summary', detail: 'test detail', issue_type: '',
                          priority: 'High', assigned_person: 'User1', status: 'Init')
        expect(issue).not_to be_valid
      end
    end
    context 'If the priority is empty' do
      it 'Can\'t register an issue without providing priority' do
        issue = Issue.new(user_id: 1, project_id: 1, summary: 'test summary', detail: 'test detail', issue_type: 'Bug',
                          priority: '', assigned_person: 'User1', status: 'Init')
        expect(issue).not_to be_valid
      end
    end
    context 'If the assigned_person is empty' do
      it 'Can\'t register an issue without providing assigned_person' do
        issue = Issue.new(user_id: 1, project_id: 1, summary: 'test summary', detail: 'test detail', issue_type: 'Bug',
                          priority: 'High', assigned_person: '', status: 'Init')
        expect(issue).not_to be_valid
      end
    end
    context 'If the status is empty' do
      it 'Can\'t register an issue without providing status' do
        issue = Issue.new(user_id: 1, project_id: 1, summary: 'test summary', detail: 'test detail', issue_type: 'Bug',
                          priority: 'High', assigned_person: 'User1', status: '')
        expect(issue).not_to be_valid
      end
    end
    context 'If all fields are provided' do
      it 'New issue is registered' do
        issue = Issue.new(user_id: 1, project_id: 1, summary: 'test summary', detail: 'test detail', issue_type: 'Bug',
                          priority: 'High', assigned_person: 'User1', status: 'Init')
        expect(issue).to be_valid
      end
    end
  end

end
