module Votable
  extend ActiveSupport::Concern

  included do
    acts_as_votable
  end

  def like(actable_user)
    liked_by(actable_user)
  end

  def dislike(actable_user)
    disliked_by(actable_user)
  end
end