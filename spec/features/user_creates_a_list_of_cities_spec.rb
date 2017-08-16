# encoding: UTF-8
require 'rails_helper'

RSpec.feature "User creates list", type: :feature do

  before :each do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: 'address@email.com'
    fill_in 'Password', with: 'thisisonlyatest'
    fill_in 'user_password_confirmation', with: 'thisisonlyatest'
    click_button 'Create Account'
    visit root_path
    click_link 'Log in'
    fill_in 'email', with: 'address@email.com'
    fill_in 'password', with: 'thisisonlyatest'
    click_button 'Enter'
    click_link 'Add City'
  end

  scenario "User can add cities to list of favorites" do
    fill_in 'place_name', with: 'New York'
    click_button 'Add'
    expect(page).to have_content 'New York'
  end

  scenario "User cannot add imaginary cities" do
    fill_in 'place_name', with: 'Ozymandias'
    click_button 'Add'
    expect(page).to have_content 'You have not added'
  end

  scenario "User can delete cities from list of favorites" do
    fill_in 'place_name', with: 'New York'
    click_button 'Add'
    expect(page).to have_content 'New York'
    click_link 'Delete'
    expect(page).to have_content 'You have not added'
  end

  scenario "User can view current temperature of cities" do
    fill_in 'place_name', with: 'New York'
    click_button 'Add'
    expect(page).to have_content '° F'
  end

  scenario "User can click on city for more information" do
    fill_in 'place_name', with: 'New York'
    click_button 'Add'
    click_link 'More Details'
    expect(page).to have_content 'Currently'
  end

  scenario "User can toggle temperature" do
    fill_in 'place_name', with: 'New York'
    click_button 'Add'
    page.find('input#option2').click
    element = page.find('div.c',visible:false).native
    expect(element.attributes['style'].content).to eq("display:none;")
  end
end
