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
        @user.badges.push(badge) if send(rule, badge.parameter)
           #user got the badge if rule is TRUE
      end
    end
  end

  private

  # количество прошедших тестов

  def check_count_testpassage?(count)
    @test_passages_count > count.to_i
  end

  #прошел с 1го раза тест
  def got_the_test_by_one_time?(count=1)
    @user.test_passages.where(test_id: @test).count==1
  end

  #прошел все тесты в одной категории

  def check_count_by_category?(category_name)

    @user.tests.show_tests_by_category(category_name).count >= Test.count_by_category(category).count

  end


end
