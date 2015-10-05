require 'test_helper'

feature 'guest profile update' do
  let(:user) { create(:guest) }

  scenario 'user updates a profile' do
    login_as user
    visit root_path
    click_link 'Edit Profile'

    fill_in 'Name', with: 'Bob'
    select 'United States', from: 'Country'
    fill_in 'Story', with: 'blah'
    click_button 'Update Profile'

    current_path.must_equal edit_profile_path

    user.profile.reload
    user.profile.name.must_equal 'Bob'
    user.profile.country.must_equal 'US'
    user.profile.story.must_equal 'blah'
  end
end
