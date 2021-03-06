class Comment < ActiveRecord::Base
  validates :text, presence: true
  validates :user_id, presence: true
  validates :entry_id, presence: true
  belongs_to :entry
  belongs_to :user
end

def self.author
  author = User.where(:id == comment.user_id)
  author
end

