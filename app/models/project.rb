class Project < ApplicationRecord
  include ModelScopes

  belongs_to :user

  validates_presence_of :title, :user, :github_link

  delegate :username, :email, to: :user, prefix: true
end
