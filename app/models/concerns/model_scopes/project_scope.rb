module ModelScopes::ProjectScope
  extend ActiveSupport::Concern

  included do
    send(:include, Module.const_get('ModelScopes::SharedScope'))
    scope :contentbase, ->(search) {
      active.where('title LIKE :search OR description LIKE :search',
                   search: "%#{search.downcase}%")
    }

    scope :tagged, ->(search) {
      active.tagged_with(search, on: :tech_stacks)
    }

    scope :searchable, ->(search) {
      contentbase(search) + tagged(search)
    }
  end
end
