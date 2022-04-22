class GitHubClient
  require 'faraday'
  require 'faraday/net_http'
  


  Faraday.default_adapter = :net_http

  attr_reader :create_gist, :http_client

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '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'


  def self.faraday_test
    @response = Faraday.get('http://httpbingo.org')
  end


  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)

    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.body = params.to_json
    end
  end


  private

  def setup_http_client
    Faraday.new(
      url: ROOT_ENDPOINT,
      headers: {'Content-Type' => 'application/json'}
    )
  end

end
