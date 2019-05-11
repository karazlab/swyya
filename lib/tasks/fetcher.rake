namespace :fetcher do
  task Github: :environment do
    number_of_days = 364
    link           = "https://api.github.com/repositories?since=#{number_of_days}"
    github_request = Net::HTTP.get(URI(link))
    records        = JSON.parse(github_request)
    html_links     = records.map { |record| record['html_url'] }
    html_links.each do |link|
      project = GithubFetcher.new(link: link, user_id: User.find_by_email('labkaraz@gmail.com').id).fetch
      project.save
    end
  end
end