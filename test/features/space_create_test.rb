require 'test_helper'

feature 'Space creation' do
  let(:user) { create(:host) }

  scenario 'Host creates a property' do
    login_as user
    visit root_path

    click_link 'Manage Your Listings'
    click_link 'List Your Space'

    fill_in 'Name', with: 'Main Street - Room 1'
    select 'United States', from: 'Country'
    fill_in 'Description', with: 'Blah blah blah'
    click_button 'Create Space'

    space = Space.last
    space.user.must_equal user

    space.name.must_equal 'Main Street - Room 1'
    space.country.must_equal 'US'
    space.description.must_equal 'Blah blah blah'

    current_path.must_equal host_dashboard_path

    page.must_have_content space.name
  end
end
