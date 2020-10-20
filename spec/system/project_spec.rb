require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  # describe "Project registration test" do
  #   context "Add new project" do
  #     before(:each) do
  #       visit root_path
  #       within("form") do
  #         fill_in('Email', with: 'user1@gmail.com')
  #         fill_in('Password', with: 'hellouser1')
  #         click_button "Log in"
  #       end
  #     end
  #     it "New project is registered" do
  #       click_link "New Project"
  #       fill_in('Name', with: 'test project 1')
  #       fill_in('Description', with: 'test description')
  #       click_button "Create Project"
  #       expect(page).to have_content("Project Created")
  #     end
  #   end
  # end

  # describe "Project show page test" do
  #   context "Show a project" do
  #     before(:each) do
  #       visit root_path
  #       within("form") do
  #         fill_in('Email', with: 'user1@gmail.com')
  #         fill_in('Password', with: 'hellouser1')
  #         click_button "Log in"
  #       end
  #     end
  #     it "Project show page display" do
  #       click_link "Show"
  #       expect(page).to have_content("Showing Project Details")
  #     end
  #   end
  # end

  # describe "Project edit test" do
  #   context "Edit a project" do
  #     before(:each) do
  #       visit root_path
  #       within("form") do
  #         fill_in('Email', with: 'user1@gmail.com')
  #         fill_in('Password', with: 'hellouser1')
  #         click_button "Log in"
  #       end
  #     end
  #     it "Project edited successfully" do
  #       click_link "Show"
  #       click_link "Edit"
  #       fill_in('Name', with: 'test project 1 edit')
  #       fill_in('Description', with: 'test description')
  #       click_button "Update Project"
  #       expect(page).to have_content("Edited Successfully")
  #     end
  #   end
  # end

  # describe "Project delete functionality test" do
  #   context "Delete a project" do
  #     before(:each) do
  #       visit root_path
  #       within("form") do
  #         fill_in('Email', with: 'user1@gmail.com')
  #         fill_in('Password', with: 'hellouser1')
  #         click_button "Log in"
  #       end
  #     end
  #     it "Project deleted successfully" do
  #       click_link "Show"
  #       click_link "Delete"
  #       expect(page).to have_content("Deleted Successfully")
  #     end
  #   end
  # end

end
