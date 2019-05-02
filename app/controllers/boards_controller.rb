class BoardsController < ApplicationController
  authorize_resource class: BoardsController

  def index
    @owned_projects = current_user.projects
    @liked_projects = current_user.get_up_voted(Project).select { |project| project.status.eql?(STATUS[:active]) }
  end
end