require 'spec_helper'

describe "visiting the site" do
  describe "a new user visits the site" do
    it "says Welcome to CycleSmart" do
      visit root_path
      expect( page ).to have_content "Welcome to CycleSmart"
    end
    it "has a form to login" do
      visit root_path
      expect( page ).to have_content "Login"
      fill_in 'Email', with: 'jay@jay.com'
      fill_in 'Password', with: 'password'
      click_on "Login"
      expect( page ).to have_content "Jay"
    end
    it "allows a user to create an account" do
      visit root_path
      click_link 'Get Started with CycleSmart'
      expect( current_path ).to eq "/users/new"
      fill_in 'Name', with: 'Phil'
      fill_in 'Email', with: 'phil@phil.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Sign Up'
      expect( page ).to have_content 'Account successfully created!'
    end
  end
  describe "logging in" do
    it "displays a map on the dashboard" do
      visit root_path
      fill_in 'Email', with: 'jay@jay.com'
      fill_in 'Password', with: 'password'
      click_on "Login"
      expect( page ).to have_css('div#location_map')
    end
  end
end

