module ModelScopes::ProjectScope
  extend ActiveSupport::Concern

  included do
    scope :active,  -> { where(status: STATUS[:active]) }

    scope :ordered_by_date, lambda {
      active.order(created_at: :desc)
    }
  end
end
