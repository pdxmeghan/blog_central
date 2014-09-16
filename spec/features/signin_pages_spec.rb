require 'rails_helper'

describe "the signin process" do
  it "signs a user in who uses the right password" do
    user = User.create(:name => "Dustin", :password => 'password')
    visit '/login'
    fill_in 'Name', :with => 'Dustin'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    expect(page).to have_content "Logged in!"
  end

  it "won't let a user sign in with a bad password" do
    user = User.create!(:name => "Someone", :password => 'password')
    visit '/login'
    fill_in 'Name', :with => 'Someone'
    fill_in 'Password', :with => 'Password'
    click_button 'Log In'
    expect(page).to have_content "Email or password is invalid."
  end
end
