module Votable
  extend ActiveSupport::Concern

  included do
    acts_as_votable cacheable_strategy: :update_columns
  end

  def like(actable_user)
    vote_by voter: actable_user
  end

  def dislike(actable_user)
    downvote_from actable_user
  end
end
