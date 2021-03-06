require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:aidan)
	end


	test "login with valid info" do
		get login_path
		post login_path, params: { session: { email: @user.email,
											  password: 'password'}}
		assert_redirected_to root_path
		follow_redirect!
		assert_select "a[href=?]", login_path, count: 0
    	assert_select "a[href=?]", logout_path
    end
end