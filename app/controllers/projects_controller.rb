class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    set_default_keywords(title = I18n.t(:projects))
    @projects = @projects.includes(:user)
                         .ordered_by_date
                         .paginate(page: params[:page],
                                   per_page: PROJECTS_PER_PAGE_USER)
  end

  def create
    @project = params[:project][:github_link].present? ? fetch_from_github : Project.new(project_params)
    @project.save ? success_response : failure_response
  end

  def show
    set_default_keywords(title = @project.title,
                         desciption = @project.description,
                         keywords = @project.try(:tech_stack_list) || DEFAULT_KEYWORDS )
  end

  def update
    @project.update(project_params) ? success_response : failure_response
  end

  def destroy
    @project.destroy
    flash[:warning] = t(:process_success)
    redirect_to projects_url
  end

  def like
    render_success_json_response if @project.like(current_user)
  end

  def dislike
    render_success_json_response if @project.dislike(current_user)
  end

  def hide
    render_success_json_response if @project.hide
  end

  def active
    render_success_json_response if @project.active
  end

  private

  def project_params
    params.require(:project)
          .permit(%i[title description image_url github_link tech_stack_list])
          .merge(user_id: current_user.id)
  end

  def success_response
    flash[:success] = t(:process_success)
    redirect_to @project
  end

  def failure_response
    flash[:danger] = t(:something_went_wrong)
    render params[:action].eql?('create') ? :new : :edit
  end

  def render_success_json_response
    render json: {  message: t(:process_success),
                    data:    { counts: @project.get_likes.count,
                               active: @project.status.eql?(STATUS[:active]) } }
  end

  def fetch_from_github
    GithubFetcher.new(link:    params[:project][:github_link],
                      user_id: current_user.id)
                  .fetch
  end
end
