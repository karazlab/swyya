module ModelScopes::ProjectScope
  extend ActiveSupport::Concern

  included do
    send(:include, Module.const_get('ModelScopes::SharedScope'))
    scope :searchable, ->(search) {
      active.where('title LIKE :search OR description LIKE :search',
                   search: "%#{search.downcase}%")
    }
  end
end
