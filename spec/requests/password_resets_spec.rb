require 'spec_helper'

describe "PasswordResets" do
	it "email user when requesting password reset" do
		user = Factory(:user)
		visit login_path
		click_link "Forgot your password?"
		fill_in "E-mail", with => user.email
		click_button "Reset password"
  end
end
