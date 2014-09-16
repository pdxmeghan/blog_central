require 'rails_helper'

describe "viewing a blog entry" do
  it "will show a blog page and its comments when clicked" do
    user = User.create!(:name => "Friend", :password => '123')
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
    entry = Entry.create!(:title => 'hey', :content => 'yo')
    visit "/users/#{user.id}"
    click_link 'hey'
    visit "/users/#{user.id}/entries/#{entry.id}"
    expect(page).to have_content 'hey'
  end
end
