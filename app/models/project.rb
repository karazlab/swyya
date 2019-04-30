class Project < ApplicationRecord
  include ModelScopes

  extend FriendlyId
  friendly_id :title, use: %i[slugged finders]

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

  def active
    update_attributes(status: STATUS[:active])
  end

  def hide
    update_attributes(status: STATUS[:inactive])
  end
end
