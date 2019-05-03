class VisitorsController < ApplicationController
  def index
    @newest_projects     = Project.ordered_by_date.limit(NEWEST_PROJECTS_LIMIT)
    @most_liked_projects = Project.most_liked.limit(MOST_LIKED_PROJECTS_LIMIT)
    @more_projects       = Project.active.paginate(page: params[:page], per_page: PROJECTS_PER_PAGE_VISITOR)

    @most_liked_ideas    = Idea.most_liked.limit(MOST_LIKED_IDEAS_LIMIT)
    @more_ideas          = Idea.active.paginate(page: params[:page], per_page: IDEAS_PER_PAGE_VISITOR)
  end
end