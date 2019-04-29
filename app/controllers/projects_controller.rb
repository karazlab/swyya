class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @newest_projects = @projects.ordered_by_date.limit(8)
  end

  def create
    @project = Project.new(project_params)
    @project.save ? success_response : failure_response
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
          .permit(%i[title description image_url github_link])
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
                    data:    { counts: @project.get_likes.count, active: @project.status.eql?(STATUS[:active]) } }
  end
end
