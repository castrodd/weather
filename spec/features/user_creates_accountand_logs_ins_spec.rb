require 'rails_helper'
require 'faker'

RSpec.feature "User creates account and logs in", type: :feature do

  scenario "User able to sign up" do
    mailbox = Faker::Internet.email
    key = Faker::Seinfeld.quote
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: mailbox
    fill_in 'Password', with: key
    fill_in 'Password confirmation', with: key
    click_button 'Create User'
    expect(page).to have_content "New account created!"
  end

  scenario "User able to log in" do
    mailbox = Faker::Internet.email
    key = Faker::Seinfeld.quote
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: mailbox
    fill_in 'Password', with: key
    fill_in 'Password confirmation', with: key
    click_button 'Create User'
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: mailbox
    fill_in 'Password', with: key
    click_button 'Log in'
    expect(page).to have_content "Logged in!"
  end
end
