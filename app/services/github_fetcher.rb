class GithubFetcher
  attr_accessor :link

  def initialize(attributes = {})
    @link = attributes[:link]
  end

  def fetch
    cleared_link      = link.gsub('https://github.com/', '') || link.gsub('http://github.com/', '')
    api_link = GITHUB_LINK + cleared_link
    debugger
    github_request    = Net::HTTP.get(URI(api_link))
    records           = JSON.parse(github_request)
    debugger
    fetched_records   = records['data']
    saved_records     = model.all
    return if fetched_records.count.eql?(saved_records.count)
    start_fetching_records(fetched_records)
  end
end