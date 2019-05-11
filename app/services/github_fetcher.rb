class GithubFetcher
  attr_accessor :link, :user_id

  def initialize(attributes = {})
    @link    = attributes[:link]
    @user_id = attributes[:user_id]
  end

  def fetch
    cleared_link            = link.gsub(/.+?com/, '')
    api_link                = URI(GITHUB_LINK + cleared_link)
    api_topics_link         = GITHUB_LINK + cleared_link + '/topics'
    api_link.query          = "client_id=#{ENV['GITHUB_ID']}&client_secret=#{ENV['GITHUB_SECRET']}"
    github_request          = Net::HTTP.get(api_link)
    record                  = JSON.parse(github_request)
    project                 = save_record_from_github(record)
    project.tech_stack_list = GithubTopicsFetcher.new(link: api_topics_link).fetch
    project
  end

  private

  def save_record_from_github(record)
    project_params  = details_hash(record)
    project         = Project.new(project_params)
  end

  def details_hash(record)
    { 
      title:       record['name'],
      description: record['description'],
      image_url:   record['owner']['avatar_url'],
      github_link: record['html_url'],
      user_id:     user_id
    }
  end
end