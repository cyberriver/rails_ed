class GitHubClient
  require 'faraday'
  require 'faraday/net_http'
  require 'octokit'


  Faraday.default_adapter = :net_http

  attr_reader :create_gist, :http_client

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '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'


  def initialize

     @http_client = Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end

  def create_gist(params)
    @http_client.create_gist(options = params)


  end


  private

  def setup_http_client
    Faraday.new(
      url: ROOT_ENDPOINT,
      headers: {'Content-Type' => 'application/json'}
    )
  end

end
