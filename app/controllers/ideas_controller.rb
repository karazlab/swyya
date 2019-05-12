class IdeasController < ApplicationController
  load_and_authorize_resource

  def index
    set_default_keywords(title = I18n.t(:ideas))
    @ideas = @ideas.ordered_by_date.paginate(page: params[:page], per_page: IDEAS_PER_PAGE_USER)
  end

  def show
    @comments = @idea.comments
    set_default_keywords(title = @idea.title, desciption = @idea.description)
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.save ? success_response : failure_response
  end

  def update
    @idea.update(idea_params) ? success_response : failure_response
  end

  def destroy
    @idea.destroy
    flash[:warning] = t(:process_success)
    redirect_to ideas_url
  end

  def like
    render_success_json_response if @idea.like(current_user)
  end

  def dislike
    render_success_json_response if @idea.dislike(current_user)
  end

  def hide
    render_success_json_response if @idea.hide
  end

  def active
    render_success_json_response if @idea.active
  end

  private

  def idea_params
    params.require(:idea)
          .permit(%i[title description])
          .merge(user_id: current_user.id)
  end

  def success_response
    flash[:success] = t(:process_success)
    redirect_to @idea
  end

  def failure_response
    flash[:danger] = t(:something_went_wrong)
    render params[:action].eql?('create') ? :new : :edit
  end

  def render_success_json_response
    render json: {  message: t(:process_success),
                    data:    { counts: @idea.get_likes.count, active: @idea.status.eql?(STATUS[:active]) } }
  end
end
