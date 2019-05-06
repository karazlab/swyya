class CommentsController < ApplicationController
  before_action :find_idea_by_id, except: %i[destroy]
  load_and_authorize_resource

  def create
    @comment = Comment.new(comment_params)
    @comment.save ? success_response : failure_response
  end

  def update
    @comment.update(comment_params) ? success_response : failure_response
  end

  def destroy
    @comment.destroy
    flash[:warning] = t(:process_success)
    redirect_to request.referer
  end

  private

  def find_idea_by_id
    @idea = Idea.find(params[:comment][:idea_id].to_i)
  end

  def comment_params
    params.require(:comment)
          .permit(:content)
          .merge(user_id: current_user.id,
                 idea_id: @idea.id)
  end

  def success_response
    flash[:success] = t(:process_success)
    redirect_to @idea
  end

  def failure_response
    flash[:danger] = t(:something_went_wrong)
    render params[:action].eql?('create') ? :new : :edit
  end
end