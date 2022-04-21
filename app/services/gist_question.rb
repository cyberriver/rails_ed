class GistQuestionService

  def initialize(question, client:nil)
    @question=question
    @test = @question.tests
    @client = client || GitHubClient.new

  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
    accept: "application/vnd.github.v3+json",
    description: "A question abount #{test.title} from TestGuru",
    files: {"test-guru-question.txt":
           {content: gist_content}
            },
    public: true
    }

  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")

  end


end
