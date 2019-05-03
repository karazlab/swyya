module ModelScopes
  extend ActiveSupport::Concern

  included do
    send(:include, Module.const_get("ModelScopes::#{name}Scope"))
  end
end