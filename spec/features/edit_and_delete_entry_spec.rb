require 'rails_helper'

describe "editing and deleting a blog entry" do
  it "will edit a blog entry" do
    user = User.create!(:name => "Friend", :password => '123')
    visit '/login'
    fill_in 'Name', :with => 'Friend'
    fill_in 'password', :with => '123'
    click_button 'Log In'
    click_link "#{user.name}"
    click_link 'Create New Entry'
    fill_in 'Title', :with => 'hey'
    fill_in 'Content', :with => 'yo'
    click_button 'Publish Entry'
    entry = Entry.create!(:title => 'hey', :content => 'yo')
    visit "/users/#{user.id}"
    click_link 'hey'
    click_link 'Edit Entry'
    fill_in 'Content', :with => 'oh yeah'
    expect(page).to have_content "oh yeah"
  end

  it "will not edit a blog entry with blank fields" do
    user = User.create!(:name => "Friend", :password => '123')
    visit '/login'
    fill_in 'Name', :with => 'Friend'
    fill_in 'password', :with => '123'
    click_button 'Log In'
    click_link "#{user.name}"
    click_link 'Create New Entry'
    fill_in 'Title', :with => 'hey'
    fill_in 'Content', :with => 'yo'
    click_button 'Publish Entry'
    entry = Entry.create!(:title => 'hey', :content => 'yo')
    visit "/users/#{user.id}"
    click_link 'hey'
    click_link 'Edit Entry'
    fill_in 'Content', :with => ''
    visit "/users/#{user.id}/entries/#{entry.id}"
    expect(page).to have_content "yo"
  end

  it "will delete a blog entry" do
    user = User.create!(:name => "Friend", :password => '123')
    visit '/login'
    fill_in 'Name', :with => 'Friend'
    fill_in 'password', :with => '123'
    click_button 'Log In'
    click_link "#{user.name}"
    click_link 'Create New Entry'
    fill_in 'Title', :with => 'hey'
    fill_in 'Content', :with => 'yo'
    click_button 'Publish Entry'
    entry = Entry.create!(:title => 'hey', :content => 'yo')
    visit "/users/#{user.id}"
    click_link 'hey'
    click_link 'Delete Entry'
    visit "/users/#{user.id}"
    expect(page).to have_content " "
  end
end
