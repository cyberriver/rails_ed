class CheckAchivementsService
  attr_reader :achivements

  def initialize(obj,current_user)
    @achivements = []
    @obj=obj
    @user=current_user

  end

  #universal service for achivements
  #it receive different objects and starts different methods

  def call

    case @obj.class.name
    when "TestPassage"
      self.check_testpassage_achive
    else
      return 0
    end

  end

  private

  def check_testpassage_achive

    if (1..5).include? @user.test_passages.count
      @achivements.push(1) #показываем badge1
    elsif @user.test_passages.count > 5
      @achivements.push(2) #show badge # 2
    end

    create_achivements
    return @achivements
  end

  def create_achivements
    @achivements.each do |badge_id|
      @user.badges.push(Badge.find(badge_id))
    end
  end

end
