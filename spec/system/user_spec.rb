require 'rails_helper'

RSpec.feature "Users", type: :feature do

  describe "User registration test" do
    context "Register new user" do
      before(:each) do
        visit root_path
        click_link "Sign up"
        within("form") do
          fill_in('Username', with: 'John')
          fill_in('Email', with: 'john@test.com')
          fill_in('Password', with: 'hellojohn')
          fill_in('Password confirmation', with: 'hellojohn')
        end
      end
      it "New user is registered" do
        click_button "Sign up"
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end
    end
    context "Check project index page without login" do
      before(:each) do
        visit projects_path
      end
      it "Redirect to login with message" do
        expect(page).to have_content("You need to sign in or sign up before continuing.")
      end
    end
  end

  describe "Testing session functionality" do
    context "Be able to login" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'user1@gmail.com')
          fill_in('Password', with: 'hellouser1')
        end
      end
      it "Login test pass" do
        click_button "Log in"
        expect(page).to have_content("Signed in successfully.")
      end
    end
    context "Test log out functionality" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'user1@gmail.com')
          fill_in('Password', with: 'hellouser1')
          click_button "Log in"
        end
      end
      it "Log out test pass" do
        click_link "Log out"
        expect(page).to have_content("You need to sign in or sign up before continuing.")
      end
    end
  end

end
