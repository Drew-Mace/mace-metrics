class RegisteredApplication < ActiveRecord::Base
  belongs_to :users
  has_many :events
end
