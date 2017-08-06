require 'rails_helper'

require 'faker'

RSpec.feature "User creates a list", type: :feature do
  scenario "User can add cities to list of favorites" do
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
    click_link 'Add City'
    fill_in 'Name', with: 'New York'
    click_button 'Add'
    expect(page).to have_content 'New York'
  end

  scenario "User cannot add imaginary cities" do
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
    click_link 'Add City'
    fill_in 'Name', with: 'Ozymandias'
    click_button 'Add'
    expect(page).to have_content 'City unavailable.'
  end

  scenario "User can delete cities from list of favorites" do
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
    click_link 'Add City'
    fill_in 'Name', with: 'New York'
    click_button 'Add'
    click_link 'Delete'
    expect(page).to have_content 'City removed.'
  end

  scenario "User can view current temperature of cities" do
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
    click_link 'Add City'
    fill_in 'Name', with: 'New York'
    click_button 'Add'
    expect(page).to have_content 'Farenheit'
  end

  scenario "User can click on city for more information" do
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
    click_link 'Add City'
    fill_in 'Name', with: 'New York'
    click_button 'Add'
    click_link 'More Details'
    expect(page).to have_content 'Currently'
  end
end
