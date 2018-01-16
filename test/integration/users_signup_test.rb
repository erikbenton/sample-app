require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test 'invalid signup information' do
  	get signup_path
  	assert_no_difference "User.count" do
  		post users_path, params: { user: { name: "",
  																			email: "foo@invalid",
  																			password: "foo",
  																			password_confirmation: "bar"} }
		end
		assert_template 'users/new'
		assert_select 'div#error_explanation'
		assert_select 'div.field_with_errors'
		assert_select "form[action='/signup']"
	end

	test 'valid signup information' do
		get signup_path
  	assert_difference "User.count", 1 do
  		post users_path, params: { user: { name: "Erik",
  																			email: "erik@valid.com",
  																			password: "foo123456",
  																			password_confirmation: "foo123456"} }
		end
		follow_redirect!
		assert_template 'users/show'
		assert_select 'div.alert-success'
	end
end
