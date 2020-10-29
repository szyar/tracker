require 'rails_helper'

RSpec.feature "ProjectMembers", type: :feature do

  describe "Member functionality test" do
    context "Project and member connections" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'user1@gmail.com')
          fill_in('Password', with: 'hellouser1')
          click_button "Log in"
        end
      end
      it "Member invitation success" do
        click_link "Show"
        fill_in('Enter the email', with: 'user2@gmail.com')
        select 'Tester', from: :role
        click_button "Invite"
        expect(page).to have_content("Add member successfully")
      end
      it "Member removing success" do
        click_link "Show"
        fill_in('Enter the email', with: 'user2@gmail.com')
        select 'Tester', from: :role
        click_button "Invite"
        click_link "Remove", match: :first
        expect(page).to have_content("Remove member successfully")
      end
    end
  end

end
