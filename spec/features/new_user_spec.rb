require 'spec_helper'

describe "visiting the site" do
  describe "a new user visits the site" do
    it "says Welcome to CycleSmart" do
      visit root_path
      expect( page ).to have_content "Welcome to"
    end
    it "has a form to login" do
      login
      expect( page ).to have_content "Jay"
    end
    it "allows a user to create an account" do
      create_new
      expect( page ).to have_content 'Account successfully created!'
    end
  end
end

def login
  visit root_path
  fill_in 'Email', with: 'jay@jay.com'
  fill_in 'Password', with: 'password'
  click_on "Login"
end

def create_new
  visit root_path
  fill_in 'Your First Name', with: 'Phil'
  fill_in 'Your Email Address', with: 'phil@phil.com'
  fill_in 'New password', with: 'password'
  fill_in 'Re-Enter Password', with: 'password'
  click_on 'Sign Up'
end