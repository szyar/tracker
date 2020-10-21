require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validation test' do
    context 'If the content is empty' do
      it 'Can\'t register a comment without providing content' do
        comment = Comment.new(content: '', user_id: 2, issue_id: 3)
        expect(comment).not_to be_valid
      end
    end
    context 'If the content is provided' do
      it 'New comment is registered' do
        comment = Comment.new(content: 'test comment', user_id: 2, issue_id: 3)
        expect(comment).to be_valid
      end
    end
  end
end
