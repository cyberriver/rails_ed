class CheckAchivementsService
  attr_reader :achivements

  def initialize(test_passage,current_user)
    @achivements = []
    @test_passage=test_passage
    @user=current_user
    @test=test_passage.test
    @test_passages_count = @user.test_passages.count

  end

  #universal service for achivements

  def call
    Badge.select do |badge|
      rule = "#{badge.rule.strip}?"
      if @user.badges.exists?(badge.id) #check if user already has such achivements
        puts "LOG: #{badge.title} already given"
      else
        if send(rule, badge.parameter)
          @user.badges.push(badge)
        end
      end
    end
  end

  private

  def check_count_testpassage?(count)
    @test_passages_count > count.to_i
  end

  def check_count_by_category?(category_name)
    category = Category.find_by(title: category_name)
    @user.tests.count_by_category(category).count >= Test.count_by_category(category).count
  end


end
