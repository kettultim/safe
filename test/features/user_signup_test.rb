require 'test_helper'

feature 'User signup' do
  scenario 'User signs up as a host' do
    user = signup_as 'Host'
    user.role.must_equal 'host'
  end

  scenario 'User signs up as a guest' do
    user = signup_as 'Guest'
    user.role.must_equal 'guest'
  end

  def signup_as role
    visit new_user_registration_path

    within '#signup' do
      fill_in 'user_email', with: build(:user).email
      fill_in 'user_password', with: test_password
      fill_in 'user_password_confirmation', with: test_password
      choose role
      click_button 'Sign Up'
    end

    User.last
  end
end
