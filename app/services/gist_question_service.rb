class GistQuestionService
  attr_reader :response

  def initialize(question, client:nil)
    @question=question
    @test = @question.test
    @client = client || GitHubClient.new
    @response = ''

  end

  def call

    @client.http_client.create_gist(gist_params)
    @response  = @client.http_client.last_response

  end

  def test_call
    test_params =   {
        description: "Test gist",
        public: true,
        files: {"test-gist.txt":
               {content: "gist_content"}
                }
      }

    @client.http_client.create_gist(test_params)
    @response  = @client.http_client.last_response
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
