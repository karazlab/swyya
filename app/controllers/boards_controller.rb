class BoardsController < ApplicationController
  authorize_resource class: BoardsController

  def index
    @owned_projects = current_user.projects
    @liked_projects = current_user.get_up_voted(Project).select { |project| project.status.eql?(STATUS[:active]) }
    @owned_ideas    = current_user.ideas
    @liked_ideas    = current_user.get_up_voted(Idea).select { |idea| idea.status.eql?(STATUS[:active]) }
  end
end