require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
 include Devise::Test::ControllerHelpers
  
  def setup
    @user1 = users(:MIMI)
    @user2 = users(:LEO)
    sign_in(@user1)
    sign_in(@user2)
  end
  
  test "less than 18 years old user should be return to loginpage" do
    patch user_path(@user1), params: { user: {
                                              username: "MIMI",
                                              sex: :male,
                                              birth: "2006-08-30",
                                              nationality: :japan,
                                              height: 179,
                                              occupation: :doctor,
                                              singleword: "Like you"} }
    assert_not flash.empty?
    assert_redirected_to pages_loginpage_path
  end  
  
  test "more than 18 years old user should be return to index" do
    patch user_path(@user2), params: { user: { username: "LEO",
                                              sex: :female,
                                              birth: "1997-08-30",
                                              nationality: :japan,
                                              height: 160,
                                              occupation: :doctor,
                                              singleword: "uuu"
                                              } }
    assert_not flash.empty?
    assert_redirected_to root_path
  end
end
