require 'test_helper'

feature 'Space show page' do
  let(:space) { create(:space) }
  let(:user) { create(:guest) }

  setup do
    login_as user
    visit space_path(space)
  end

  scenario 'It includes the body' do
    page.must_have_content space.description
  end

  scenario 'It includes the availabilities' do
    space.availabilities.upcoming.count.wont_equal 0

    space.availabilities.upcoming.each do |a|
      page.must_have_content a.range
    end
  end

  scenario 'It includes the photos' do
    space.photos.count.wont_equal 0

    space.photos.each do |p|
      page.body.must_include p.url(:medium)
    end
  end
end
