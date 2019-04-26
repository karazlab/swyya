json.extract! project, :id, :title, :description, :image_url, :github_link, :user_id, :created_at, :updated_at
json.url project_url(project, format: :json)
