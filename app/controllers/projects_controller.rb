class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @projects = Project.ordered_by_date
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
    flash[:notice] = t(:process_sucess)
    redirect_to projects_url
  end

  private

  def project_params
    params.require(:project)
          .permit(%i[title description image_url github_link])
          .merge(user_id: current_user.id)
  end

  def success_response
    flash[:notice] = t(:process_success)
    redirect_to @project
  end

  def failure_response
    render :new
  end
end
