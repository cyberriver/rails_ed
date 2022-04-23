class GitHubClient
  require 'faraday'
  require 'faraday/net_http'
  require 'octokit'


  Faraday.default_adapter = :net_http

  attr_reader :create_gist, :http_client

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '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'


  def initialize
  #  @http_client = setup_http_client
     @http_client = Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end

  def create_gist(params)
    @http_client.create_gist(options = params)

  #  @http_client.post('gists') do |request|
  #    request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
  #    request.body = params.to_json
  #  end
  end


  private

  def setup_http_client
    Faraday.new(
      url: ROOT_ENDPOINT,
      headers: {'Content-Type' => 'application/json'}
    )
  end

end
