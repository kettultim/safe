require 'test_helper'

feature 'Space creation' do
  let(:user) { create(:host) }

  scenario 'Host creates a property' do
    login_as user
    visit root_path

    click_link 'Manage Your Listings'
    click_link 'List Your Space'

    fill_in :space_name, with: 'Main Street - Room 1'
    fill_in :space_locality, with: 'Dunmore'
    fill_in :space_administrative_area, with: 'PA'
    fill_in :space_country, with: 'US'
    fill_in :space_postal_code, with: '12345'
    fill_in :space_latitude, with: '1'
    fill_in :space_longitude, with: '2'
    fill_in :space_number_of_rooms, with: '11'
    fill_in :space_number_of_people_allowed, with: '12'
    fill_in :space_description, with: 'Blah blah blah'
    click_button 'Create Space'

    space = Space.last
    space.user.must_equal user

    space.name.must_equal 'Main Street - Room 1'
    space.locality.must_equal 'Dunmore'
    space.administrative_area.must_equal 'PA'
    space.country.must_equal 'US'
    space.postal_code.must_equal '12345'
    space.latitude.must_equal 1
    space.longitude.must_equal 2
    space.description.must_equal 'Blah blah blah'
    space.number_of_rooms.must_equal 11
    space.number_of_people_allowed.must_equal 12

    current_path.must_equal host_dashboard_path

    page.must_have_content space.name
  end
end
