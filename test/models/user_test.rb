require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "can construct User from github auth hash" do
    auth_hash = {
      :uid => "1234",
      'info' => {
        'email' => '1234@test.com',
        'name' => 'test user'
      }
    }

    user = User.build_from_github(auth_hash)
    assert user.valid?
    assert_equal "github", user.provider
    assert_equal "1234", user.uid
  end
end
