class Project < ApplicationRecord
  include ModelScopes
  include Votable
  include Statusable

  extend FriendlyId
  friendly_id :title, use: %i[slugged finders]

  belongs_to :user

  validates_presence_of :title, :user, :github_link

  delegate :username, :email, to: :user, prefix: true

  acts_as_taggable_on :tech_stacks
end
