class ApplicationController < ActionController::Base
  before_action :track_whodunnit, if: proc { current_user.present? }

  private

  def track_whodunnit
    PaperTrail.whodunnit = current_user.id
  end
end
