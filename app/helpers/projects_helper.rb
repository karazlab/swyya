module ProjectsHelper
  def user_information(project)
    project.user_username || project.user_email
  end
end
