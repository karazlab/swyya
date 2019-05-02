module ProjectsHelper
  def user_information(project)
    project.user_username || project.user_email
  end

  def project_liked?
    return false unless user_signed_in?
    current_user.voted_for?(@project) && @project.get_upvotes.where(voter: current_user).present?
  end

  def project_image(project)
    project.image_url.present? ? project.image_url : asset_path('missing.png')
  end
end
