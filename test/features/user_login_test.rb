require 'test_helper'

feature 'User Login' do
  scenario 'Regular users are redirected to the homepage' do
    login(create(:user))
    current_path.must_equal root_path
  end

  scenario 'Admins are redirected to the admin dashboard' do
    login(create(:admin))
    current_path.must_equal admin_index_path
  end
end
