class User < ApplicationRecord

  def return_tests(level)
    Test.joins('JOIN users_tests on test_id=user_test.test_id')
      .where('test.level=:level AND users_tests.user_id=:user_id', level:level,user_id:id)


  end
end
