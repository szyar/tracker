require 'rails_helper'

RSpec.feature "Issues", type: :feature do

  describe "Issue crud test" do
    # FactoryBot.create(:user1)
    # FactoryBot.create(:project1)
    # FactoryBot.create(:project_member1)
    # FactoryBot.create(:project_member2)
    context "Register a new issue" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'user2@gmail.com')
          fill_in('Password', with: 'hellouser2')
          click_button "Log in"
        end
      end
      it "Issue registration success" do
        click_link "Show"
        click_link "Add New Issue"
        fill_in('Summary', with: 'Test Summary')
        fill_in('Detail', with: 'Test Detail')
        select 'Bug', from: :issue_issue_type
        select 'Low', from: :issue_priority
        select 'User2', from: :issue_assigned_person
        select 'Init', from: :issue_status
        click_button "Create Issue"
        expect(page).to have_content("Issue Created")
      end
    end
    context "View a registered issue" do
      # FactoryBot.create(:issue1)
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'user2@gmail.com')
          fill_in('Password', with: 'hellouser2')
          click_button "Log in"
        end
      end
      it "Issue detail page displayed" do
        click_link "Show"
        click_link "Detail", match: :first
        expect(page).to have_content("test summary2")
      end
    end
    context "Edit an issue" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'user2@gmail.com')
          fill_in('Password', with: 'hellouser2')
          click_button "Log in"
        end
      end
      it "Issue edited successfully" do
        click_link "Show"
        click_link "Detail", match: :first
        click_link "Edit Issue"
        fill_in('Summary', with: 'Test Summary edited')
        click_button "Update Issue"
        expect(page).to have_content("Edited Successfully")
      end
    end
    context "Close an issue" do
      # FactoryBot.create(:issue2)
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'user2@gmail.com')
          fill_in('Password', with: 'hellouser2')
          click_button "Log in"
        end
      end
      it "Issue closed succesfully" do
        click_link "Show"
        click_link "Detail", match: :first
        click_link "Close Issue"
        expect(page).to have_content("Close Issue Successfully")
      end
    end
  end

end
