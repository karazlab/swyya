module ModelScopes::SharedScope
  extend ActiveSupport::Concern

  included do
    scope :active,  -> { where(status: STATUS[:active]) }

    scope :ordered_by_date, lambda {
      active.order(created_at: :desc)
    }

    scope :most_liked, lambda {
      active.order(cached_weighted_average: :desc)
    }

    scope :random_order, lambda {
      order('RANDOM()')
    }
  end
end