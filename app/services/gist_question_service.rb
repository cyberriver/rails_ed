class GistQuestionService

  def initialize(question, client:nil)
    @question=question
    @test = @question.test
    @client = client || GitHubClient.new

  end

  def call
    puts("gist params: #{gist_params}")
    @client.http_client.create_gist(gist_params)

  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
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