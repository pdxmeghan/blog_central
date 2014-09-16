require 'rails_helper'

describe "Editng and deleting comments" do
  it "should edit a comment" do
    user = User.create(:name => "Friend", :password => '123')
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
    visit "/users/#{user.id}/entries/#{entry.id}"
    fill_in "Comment", :with => "Cool"
    click_button "Submit Comment"
    click_link "Edit"
    fill_in "Comment", :with => "Rad"
    expect(page).to have_content "Rad"
  end

  it "shouldn't edit a comment with a blank field" do
    user = User.create(:name => "Friend", :password => '123')
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
    visit "/users/#{user.id}/entries/#{entry.id}"
    fill_in "Comment", :with => "Cool"
    click_button "Submit Comment"
    click_link "Edit"
    fill_in "Comment", :with => " "
    expect(page).to have_content "Comment field can't be blank"
  end

  it "should delete a comment" do
    user = User.create(:name => "Friend", :password => '123')
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
    visit "/users/#{user.id}/entries/#{entry.id}"
    fill_in "Comment", :with => "Cool"
    click_button "Submit Comment"
    click_link "Delete"
    expect(page).to have_content " "
  end
end

