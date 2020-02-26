class BoardsController < ApplicationController
  authorize_resource class: BoardsController

  def index
    @owned_projects = Project.includes(:user).where(user: current_user)
    @liked_projects = current_user.get_up_voted(Project).select { |project| project.status.eql?(STATUS[:active]) }
                                  .reject { |project| project if current_user.get_down_voted(Project).include?(project) }
    # @owned_ideas    = Idea.includes(:user).where(user: current_user)
    # @liked_ideas    = current_user.get_up_voted(Idea).select { |idea| idea.status.eql?(STATUS[:active]) }
    #                               .reject { |idea| idea if current_user.get_down_voted(Idea).include?(idea)}
  end
end
