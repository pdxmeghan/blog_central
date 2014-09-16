require 'rails_helper'

describe "creating a comment" do
  it "will create a comment on an entry successfully" do
    user = User.create!(:name => "Friend", :password => '123')
    visit '/login'
    fill_in 'Name', :with => 'Friend'
    fill_in 'password', :with => '123'
    click_button 'Log In'
    click_link "#{user.name}"
    click_link "Create New Entry"
    fill_in 'Title', :with => 'hey'
    fill_in 'Content', :with => 'yo'
    click_button 'Publish Entry'
    entry = Entry.create!(:title => 'hey', :content => 'yo')
    click_link 'hey'
    fill_in 'Comment', :with => 'Cool story'
    expect(page).to have_content 'Cool story'
  end

  it "will not allow a user to submit a blank comment field" do
    user = User.create!(:name => "Friend", :password => '123')
    visit '/login'
    fill_in 'Name', :with => 'Friend'
    fill_in 'password', :with => '123'
    click_button 'Log In'
    click_link "#{user.name}"
    click_link "Create New Entry"
    fill_in 'Title', :with => 'hey'
    fill_in 'Content', :with => 'yo'
    click_button 'Publish Entry'
    entry = Entry.create!(:title => 'hey', :content => 'yo')
    click_link 'hey'
    fill_in 'Comment', :with => 'Cool story'
    expect(page).to have_content "Sorry, comment field must be filled in"
  end
end
