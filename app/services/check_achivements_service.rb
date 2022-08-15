class CheckAchivementsService
  attr_reader :achivements

  def initialize(test_passage,current_user)
    @achivements = []
    @test_passage=test_passage
    @user=current_user
    @test_passages_count = @user.test_passages.count

  end

  #universal service for achivements

  def call
    check_count_testpassage
    check_count_by_category
  end

  private

  def check_count_testpassage

    if (1..5).include? @test_passages_count
      @user.badges.push(Badge.where("title LIKE ?", "%ович%"))
    elsif @test_passages_count > 5
      @user.badges.push(Badge.where("title LIKE ?", "%етеран%"))  #save badge # 2
    end


  end

  def check_count_by_category
    last_category = @test_passage.test.category_id

    if @user.tests.count_by_category(last_category).count >= Test.count_by_category(last_category).count
      @user.badges.push(Badge.where("title LIKE ?", "%категори%"))  #save badge # 3

    end

  end

  def create_achivements
    @achivements.each do |badge_id|
      @user.badges.push(Badge.find(badge_id))
    end
  end

end
