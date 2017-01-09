require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(battletag: "test1#12345", email: "test1@test.com", password: 'pass',
                     password_confirmation: 'pass')
  end

  test "user should be valid" do
    assert @user.valid?
  end


  test "email addresses should be unique" do
    new_user = @user.dup
    @user.save
    assert_not new_user.valid?
  end
end
