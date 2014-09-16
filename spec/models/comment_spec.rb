require 'rails_helper'

describe Comment do
  it {should validate_presence_of :text}
  it {should validate_presence_of :user_id}
  it {should validate_presence_of :entry_id}
  it {should belong_to :entry}
end
