class Project < ApplicationRecord
  include ModelScopes

  belongs_to :user

  validates_presence_of :title, :user, :github_link

  delegate :username, :email, to: :user, prefix: true

  acts_as_votable

  def like(actable_user)
    liked_by(actable_user)
  end

  def dislike(actable_user)
    disliked_by(actable_user)
  end
end
