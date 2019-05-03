module Statusable
  extend ActiveSupport::Concern

  def active
    update_attributes(status: STATUS[:active])
  end

  def hide
    update_attributes(status: STATUS[:inactive])
  end
end