class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  delegate :username, :email, to: :user, prefix: true

  validates_presence_of :content, :user, :idea
end
