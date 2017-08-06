require 'rails_helper'
require 'faker'

RSpec.feature "User creates account", type: :feature do

  scenario "User able to sign up" do
    mailbox = Faker::Internet.email
    key = Faker::Seinfeld.quote
    visit root_path
    click_link 'Sign up'
    fill_in 'user_email', with: mailbox
    fill_in 'user_password', with: key
    fill_in 'user_password_confirmation', with: key
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
    expect(page).to have_content "Logged in"
  end

  scenario "User inputs wrong confirmation details" do
    mailbox = Faker::Internet.email
    key = Faker::Seinfeld.quote
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: mailbox
    fill_in 'Password', with: key
    fill_in 'Password confirmation', with: 'Wrong password'
    click_button 'Create User'
    expect(page).to have_content 'Please try again!'
  end

  scenario "User inputs wrong sign in details" do
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
    fill_in 'Password', with: "Wrong"
    click_button 'Log in'
    expect(page).to have_content "Something was wrong with your email and/or password."
  end

  scenario "User signs in and logs out" do
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
    click_link 'Log out'
    expect(page).to have_content 'Weather Station'
  end
end
