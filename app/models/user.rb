class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :name
  has_many :entries, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates_length_of :name, :maximum => 10
end
