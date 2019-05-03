module ProjectsHelper
  def project_image(project)
    project.image_url.present? ? project.image_url : asset_path('missing.png')
  end
end
