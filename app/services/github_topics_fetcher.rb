class GithubTopicsFetcher
  attr_accessor :link

  def initialize(attributes = {})
    @link    = attributes[:link]
  end

  def fetch
    uri               = URI.parse(link)
    uri.query         = "client_id=#{ENV['GITHUB_ID']}&client_secret=#{ENV['GITHUB_SECRET']}"
    http              = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl      = true
    request           = Net::HTTP::Get.new(uri.request_uri)
    request["Accept"] = "application/vnd.github.mercy-preview+json"
    response          = http.request(request)
    record            = JSON.parse(response.body)
  
    record['names']
  end
end