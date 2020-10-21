require 'rails_helper'

RSpec.describe ProjectMember, type: :model do
  describe 'Validation test' do
    context 'If role is empty' do
      it 'Can\'t register a project member without providing role' do
        project_member = ProjectMember.new(role: '', user_id: 1, project_id: 1)
        expect(project_member).not_to be_valid
      end
    end
    context 'If the user is empty' do
      it 'Can\'t register a project member without providing user' do
        project_member = ProjectMember.new(role: 'Developer', user_id: '', project_id: 1)
        expect(project_member).not_to be_valid
      end
    end
    context 'If the project is empty' do
      it 'Can\'t register a project member without providing project' do
        project_member = ProjectMember.new(role: 'Developer', user_id: 1, project_id: '')
        expect(project_member).not_to be_valid
      end
    end
    context 'If all fields are provided' do
      it 'New project member record is registered' do
        project_member = ProjectMember.new(role: 'Developer', user_id: 1, project_id: 1)
        expect(project_member).to be_valid
      end
    end
  end
end
