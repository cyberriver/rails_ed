class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :badge


  def check_for_achivement(test_passage)
    achivements = []
    if test_passage.user.test_passages.count > 1
      achivements.push(1) #показываем badge1
    end

    return achivements
  end

end
