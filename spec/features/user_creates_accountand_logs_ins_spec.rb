require 'rails_helper'
require 'faker'


RSpec.feature "User creates account", type: :feature do
  before :each do |example|
   unless example.metadata[:no_before_block]
     @mailbox = Faker::Internet.email
     @key = Faker::Seinfeld.quote
     visit root_path
     click_link 'Sign up'
     fill_in 'user_email', with: @mailbox
     fill_in 'user_password', with: @key
     fill_in 'user_password_confirmation', with: @key
     click_button 'Create Account'
    end
  end

  scenario "User able to sign up" do
    expect(page).to have_content "New account created!"
  end

  scenario "User able to log in" do
    click_link 'Log in'
    fill_in 'email', with: @mailbox
    fill_in 'password', with: @key
    click_button 'Enter'
    expect(page).to have_content "Welcome"
  end

  scenario "User inputs wrong sign in details" do
    click_link 'Log in'
    fill_in 'email', with: @mailbox
    fill_in 'password', with: "Wrong"
    click_button 'Enter'
    expect(page).to have_content "Something was wrong with your email and/or password."
  end

  scenario "User signs in and logs out" do
    click_link 'Log in'
    fill_in 'email', with: @mailbox
    fill_in 'password', with: @key
    click_button 'Enter'
    click_link 'Log out'
    expect(page).to have_content 'Weather Station'
  end

  scenario "User inputs wrong confirmation details", :no_before_block do
    @mailbox = Faker::Internet.email
    @key = Faker::Seinfeld.quote
    visit root_path
    click_link 'Sign up'
    fill_in 'user_email', with: @mailbox
    fill_in 'user_password', with: @key
    fill_in 'user_password_confirmation', with: 'wrongkey'
    click_button 'Create Account'
    expect(page).to have_content 'Please try again!'
  end
end
