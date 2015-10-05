require 'test_helper'

feature 'host profile update' do
  let(:user) { create(:host) }

  scenario 'user updates a profile' do
    login_as user
    visit root_path
    click_link 'Edit Profile'

    fill_in 'Name', with: 'Bob'
    select 'United States', from: 'Country'
    click_button 'Update Profile'

    current_path.must_equal edit_profile_path

    user.profile.reload
    user.profile.name.must_equal 'Bob'
    user.profile.country.must_equal 'US'
  end
end
