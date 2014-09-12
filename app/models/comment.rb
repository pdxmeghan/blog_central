class Comment < ActiveRecord::Base
  validates :text, presence: true
  validates :user_id, presence: true
  validates :entry_id, presence: true
  belongs_to :entry
  belongs_to :user
end


