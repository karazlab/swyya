class TrendingOnGithub
  attr_accessor :link

  def initialize(attributes = {})
    @link = attributes[:link]
  end

  def fetch
    uri     = URI.parse(link)
    request = Net::HTTP.get(uri)
    records = JSON.parse(request)
    fetched_records(records)
  end

  private

  def fetched_records(records)
    records_hash = {}
    records.each_with_index do |record, index|
      records_hash[index] = { name:        record['name'],
                              url:         record['url'],
                              description: record['description'],
                              image_url:   record['builtBy'].present? ? record['builtBy'][0]['avatar'] : ActionController::Base.helpers.asset_path('missing.png')}
    end
    records_hash_filtered(records_hash)
  end

  def records_hash_filtered(records_hash)
    records_hash.map { |record| record[1] }
  end
end
