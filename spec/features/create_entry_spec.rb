require 'rails_helper'

describe "creating a new entry process" do
  it "creates a new entry when entering all fields" do
    user = User.create(:name => "Friend", :password => '123')
    visit '/login'
    fill_in 'Name', :with => 'Friend'
    fill_in 'password', :with => '123'
    click_button 'Log In'
    click_link "#{user.name}"
    visit "/users/#{user.id}"
    click_link 'Create New Entry'
    visit "/users/#{user.id}/entries/new"
    fill_in 'Title', :with => 'hey'
    fill_in 'Content', :with => 'yo'
    click_button 'Publish Entry'
    expect(page).to have_content "hey has been created!"
  end

  it "gives an error when a user doesn't complete the form" do
    user = User.create(:name => "Friend", :password => '123')
    visit '/login'
    fill_in 'Name', :with => 'Friend'
    fill_in 'password', :with => '123'
    click_button 'Log In'
    click_link "#{user.name}"
    visit "/users/#{user.id}"
    click_link 'Create New Entry'
    visit "/users/#{user.id}/entries/new"
    fill_in 'Title', :with => ''
    fill_in 'Content', :with => 'yo'
    click_button 'Publish Entry'
    expect(page).to have_content "Title can't be blank"
  end
end

