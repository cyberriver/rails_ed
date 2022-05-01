class GistQuestionService
  attr_reader :response

  ACCESS_TOKEN = ENV['GIT_HUB_CLIENT']

  def initialize(question, client:nil)
    @question=question
    @test = @question.test
    @client = client || Octokit::Client.new( access_token: ACCESS_TOKEN)
    @response = ''

  end

  def call

    @client.create_gist(gist_params)
    @response  = @client.last_response
  end

  def success?

    if @client.last_response.status.in?(200..299)
      true
    else
      false
    end
  end





  def test_call
    test_params =   {
        description: "Test gist",
        public: true,
        files: {"test-gist.txt":
               {content: "gist_content"}
                }
      }

    @client.create_gist(test_params)
    @response  = @client.last_response
  end

  private

  def gist_params
    {
      description: I18n.t('gist.params', title: @test.title),
      public: true,
      files: {"test-guru-question.txt":
             {content: gist_content}
              }
    }

  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:title)
    content.join("\n")

  end


end
