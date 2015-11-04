require 'test_helper'

feature 'Space update' do
  let(:space) { create(:space) }

  setup do
    @features = create_list(:feature, 4)

    login_as space.user
    visit root_path
    click_link 'Manage Your Listings'

    within ".space-#{space.id}" do
      click_link 'Edit'
    end

    fill_in :space_name, with: 'Main Street - Room 2'
    fill_in :space_locality, with: 'New Dunmore'
    fill_in :space_administrative_area, with: 'CA'
    fill_in :space_country, with: 'US'
    fill_in :space_postal_code, with: '11111'
    fill_in :space_latitude, with: '2'
    fill_in :space_longitude, with: '3'
    fill_in :space_number_of_rooms, with: '4'
    fill_in :space_number_of_people_allowed, with: '5'
    fill_in :space_description, with: 'Blah blah'
    check @features.first.name
    check @features.last.name
    click_button 'Update Space'
  end

  scenario 'it updates the space and redirects to the dashboard' do
    space.reload
    space.name.must_equal 'Main Street - Room 2'
    space.locality.must_equal 'New Dunmore'
    space.administrative_area.must_equal 'CA'
    space.country.must_equal 'US'
    space.postal_code.must_equal '11111'
    space.latitude.must_equal 2
    space.longitude.must_equal 3
    space.description.must_equal 'Blah blah'
    space.number_of_rooms.must_equal 4
    space.number_of_people_allowed.must_equal 5
    space.features.must_include @features.first
    space.features.must_include @features.last

    current_path.must_equal host_dashboard_path
  end
end
