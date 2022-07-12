class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge


  def self.check_for_achivement(obj)
    @achivements = []

    #universal service for achivements
    #it receive different objects and starts different methods

    case obj.class.name
    when "TestPassage"
      self.check_testpassage_achive(obj)
    else
      return 0
    end

  end

  private

  def self.check_testpassage_achive(test_passage)
    if test_passage.class.name == 'TestPassage'
    end
    if test_passage.user.test_passages.count > 5
      @achivements.push(1) #показываем badge1
    end
    return @achivements
  end



end
