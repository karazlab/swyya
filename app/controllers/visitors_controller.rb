class VisitorsController < ApplicationController
  def index
    set_default_keywords

    @newest_projects = Project.ordered_by_date
                              .limit(NEWEST_PROJECTS_LIMIT)
                              .random_order

    @more_ideas = Idea.active
                      .paginate(page: params[:page],
                                per_page: IDEAS_PER_PAGE_VISITOR)
                      .random_order

    @tags_cloud = Project.tag_counts_on(:tech_stacks)
                         .order(count: :desc)
                         .limit(TAGS_LIMIT)
                         .order('RANDOM()')

    @trending = Rails.cache.fetch(expires_in: 1.day) do
                  TrendingOnGithub.new(link: TRENDING_LINK)
                                  .fetch
                                  .first(TRENDING_LIMIT)
                end
  end

  def search
    set_default_keywords('Search Open Source Projects')
    if params[:search].present?
      projects = Project.searchable(params[:search])
      ideas    = Idea.searchable(params[:search])
      @results = merge_results(projects, ideas).paginate(page: params[:page],
                                                         per_page: SEARCH_RESULTS)
    else
      @results = []
    end
  end

  private

  def merge_results(projects, ideas)
    results = {}
    projects.each do |project|
      results["project_#{project.id}"] = { title: project.title,
                                           description: project.description,
                                           link: project_url(project) }
    end
    ideas.each do |idea|
      results["idea_#{idea.id}"] = { title: idea.title,
                                     description: idea.description,
                                     link: idea_url(idea) }
    end
    results.map { |record| record.last }
  end
end
