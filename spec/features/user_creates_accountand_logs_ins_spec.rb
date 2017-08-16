require 'rails_helper'

RSpec.feature "User creates account", type: :feature do

  before :each do
    visit root_path
    click_link 'Sign up'
    fill_in 'user_email', with: 'mailbox'
    fill_in 'user_password', with: 'mailboxkey'
    fill_in 'user_password_confirmation', with: 'mailboxkey'
    click_button 'Create Account'
  end

  scenario "User able to sign up" do
    expect(page).to have_content "New account created!"
  end

  scenario "User able to log in" do
    click_link 'Log in'
    fill_in 'email', with: 'mailbox'
    fill_in 'password', with: 'mailboxkey'
    click_button 'Enter'
    expect(page).to have_content "Welcome"
  end

  scenario "User inputs wrong sign in details" do
    click_link 'Log in'
    fill_in 'email', with: 'mailbox'
    fill_in 'password', with: "Wrong"
    click_button 'Enter'
    expect(page).to have_content "Something was wrong with your email and/or password."
  end

  scenario "User signs in and logs out" do
    click_link 'Log in'
    fill_in 'email', with: 'mailbox'
    fill_in 'password', with: 'mailboxkey'
    click_button 'Enter'
    click_link 'Log out'
    expect(page).to have_content 'Weather Station'
  end
end

RSpec.feature "User fails to create account", type: :feature do
  scenario "User inputs wrong confirmation details" do
    visit root_path
    click_link 'Sign up'
    fill_in 'user_email', with: 'mailbox'
    fill_in 'user_password', with: 'mailboxkey'
    fill_in 'user_password_confirmation', with: 'wrongkey'
    click_button 'Create Account'
    expect(page).to have_content 'Please try again!'
  end
end
