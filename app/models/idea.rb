class Idea < ApplicationRecord
  include ModelScopes
  include Votable
  include Statusable

  extend FriendlyId
  friendly_id :title, use: %i[slugged finders]

  belongs_to :user

  has_many :comments, dependent: :destroy

  validates_presence_of :title, :user

  delegate :username, :email, to: :user, prefix: true
end
