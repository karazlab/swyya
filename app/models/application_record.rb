class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  has_paper_trail
end
