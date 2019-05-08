class VisitorsController < ApplicationController
  def index
    @newest_projects     = Project.ordered_by_date.limit(NEWEST_PROJECTS_LIMIT)
    @most_liked_projects = Project.most_liked.limit(MOST_LIKED_PROJECTS_LIMIT)
    @more_projects       = Project.active.paginate(page: params[:page], per_page: PROJECTS_PER_PAGE_VISITOR)

    @most_liked_ideas    = Idea.most_liked.limit(MOST_LIKED_IDEAS_LIMIT)
    @more_ideas          = Idea.active.paginate(page: params[:page], per_page: IDEAS_PER_PAGE_VISITOR)
  end

  def search
    if params[:search].present?
      projects = Project.searchable(params[:search])
      ideas    = Idea.searchable(params[:search])
      @results = merge_results(projects, ideas).paginate(page: params[:page], per_page: SEARCH_RESULTS)
    else
      @results = []
    end    
  end

  private

  def merge_results(projects, ideas)
    results = {}
    projects.each do |project|
      results["project_#{project.id}"] = { title: project.title, description: project.description, link: project_url(project) }
    end
    ideas.each do |idea|
      results["idea_#{idea.id}"] = { title: idea.title, description: idea.description, link: idea_url(idea) }
    end
    results.map { |record| record.last }
  end
end